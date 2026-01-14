import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/crypto/identity_keys.dart';
import '../../../core/device/device_info_service.dart';
import '../../../core/models/auth/passkey_attestation.dart';
import '../../../core/models/device/device.dart';
import '../../../core/models/keys/prekey.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _handleController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _showPasswordField = false;
  bool _isPasskeyLoading = false;

  @override
  void dispose() {
    _handleController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginWithPassword() async {
    if (!_formKey.currentState!.validate()) return;

    ref.read(authProvider.notifier).clearError();

    final success = await ref.read(authProvider.notifier).login(
      handle: _handleController.text.trim(),
      password: _passwordController.text,
    );

    if (success && mounted) {
      context.go('/chats');
    }
  }

  Future<void> _loginWithPasskey() async {
    final handle = _handleController.text.trim();
    if (handle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter your handle first'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isPasskeyLoading = true);

    try {
      final authService = ref.read(authServiceProvider);
      final storage = ref.read(secureStorageProvider);
      final deviceInfo = ref.read(deviceInfoProvider);

      // Step 1: Get passkey login options from server
      final options = await authService.getPasskeyLoginOptions(handle);

      // Step 2: Trigger native passkey UI using PasskeyAuthenticator
      final authenticator = PasskeyAuthenticator();
      final authenticateResponse = await authenticator.authenticate(
        AuthenticateRequestType(
          relyingPartyId: options.rpId,
          challenge: options.challenge,
          timeout: options.timeout,
          userVerification: options.userVerification,
          mediation: MediationType.Optional,
          preferImmediatelyAvailableCredentials: true,
          allowCredentials: options.allowCredentials
              .map((c) => CredentialType(
                    type: c.type,
                    id: c.id,
                    transports: c.transports ?? [],
                  ))
              .toList(),
        ),
      );

      // Step 3: Check if we need to bootstrap a new device
      String? identityKeyPub = await storage.getIdentityPublicKey();
      int? registrationId = await storage.getRegistrationId();

      DeviceBootstrap? deviceBootstrap;
      InitialKeys? initialKeys;

      if (identityKeyPub == null || registrationId == null) {
        // Generate new device keys
        final keyPair = await IdentityKeyService.generateIdentityKeyPair();
        identityKeyPub = keyPair.publicKey;
        registrationId = keyPair.registrationId;

        await storage.saveIdentityKeys(
          privateKey: keyPair.privateKey,
          publicKey: keyPair.publicKey,
          registrationId: keyPair.registrationId,
        );

        final deviceName = await deviceInfo.getDeviceName();

        deviceBootstrap = DeviceBootstrap(
          deviceName: deviceName,
          identityKeyPub: identityKeyPub,
          registrationId: registrationId,
        );

        // Generate initial keys
        final identityPrivateKey = await storage.getIdentityPrivateKey();
        if (identityPrivateKey != null) {
          final signedPrekey = await IdentityKeyService.generateSignedPrekey(
            identityPrivateKey: identityPrivateKey,
            keyId: 1,
          );

          initialKeys = InitialKeys(
            signedPreKey: SignedPreKey(
              keyId: signedPrekey['keyId'] as int,
              publicKey: signedPrekey['publicKey'] as String,
              signature: signedPrekey['signature'] as String,
            ),
            oneTimePreKeys: [],
          );
        }
      }

      // Step 4: Convert authenticator response to our PasskeyAssertion model
      final assertion = PasskeyAssertion(
        id: authenticateResponse.id,
        rawId: authenticateResponse.rawId,
        type: 'public-key',
        response: PasskeyAssertionResponse(
          clientDataJSON: authenticateResponse.clientDataJSON,
          authenticatorData: authenticateResponse.authenticatorData,
          signature: authenticateResponse.signature,
          userHandle: authenticateResponse.userHandle.isNotEmpty
              ? authenticateResponse.userHandle
              : null,
        ),
      );

      // Step 5: Verify with server
      final response = await authService.verifyPasskeyLogin(
        handle: handle,
        assertion: assertion,
        device: deviceBootstrap,
        deviceKeys: initialKeys,
      );

      // Save tokens
      await storage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      await storage.saveUserInfo(
        userId: response.user.id,
        deviceId: response.device.id,
        handle: handle,
      );

      if (mounted) {
        context.go('/chats');
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Passkey login failed';
        if (e.toString().contains('cancelled') ||
            e.toString().contains('Cancelled')) {
          errorMessage = 'Passkey authentication was cancelled';
        } else if (e.toString().contains('not supported') ||
            e.toString().contains('NotSupported')) {
          errorMessage = 'Passkeys are not supported on this device';
        } else if (e.toString().contains('NoCredentials')) {
          errorMessage = 'No passkeys found for this account';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isPasskeyLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading =
        authState.status == AuthStatus.loading || _isPasskeyLoading;

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.errorMessage != null &&
          previous?.errorMessage != next.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Icon(
                    Icons.lock_outline,
                    size: 64,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 24),

                  // Title
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Handle field
                  TextFormField(
                    controller: _handleController,
                    decoration: const InputDecoration(
                      labelText: 'Handle',
                      hintText: 'your.handle',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    enableSuggestions: false,
                    enabled: !isLoading,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your handle';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Passkey button (primary action)
                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: isLoading ? null : _loginWithPasskey,
                      icon: _isPasskeyLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.fingerprint),
                      label: const Text('Sign in with Passkey'),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Divider with "or"
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                              color: AppColors.textSecondary.withAlpha(77))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                              color: AppColors.textSecondary.withAlpha(77))),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Toggle password field
                  if (!_showPasswordField)
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () => setState(() => _showPasswordField = true),
                      child: const Text('Use password instead'),
                    )
                  else ...[
                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(
                                () => _obscurePassword = !_obscurePassword);
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      enabled: !isLoading,
                      onFieldSubmitted: (_) => _loginWithPassword(),
                      validator: (value) {
                        if (_showPasswordField &&
                            (value == null || value.isEmpty)) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Password login button
                    SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: isLoading ? null : _loginWithPassword,
                        child: authState.status == AuthStatus.loading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Sign In with Password'),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed:
                            isLoading ? null : () => context.go('/auth/register'),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
