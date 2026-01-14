import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/api/api_client.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/crypto/identity_keys.dart';

// Auth state
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final String? userId;
  final String? deviceId;
  final String? handle;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.userId,
    this.deviceId,
    this.handle,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? userId,
    String? deviceId,
    String? handle,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      deviceId: deviceId ?? this.deviceId,
      handle: handle ?? this.handle,
      errorMessage: errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiClient _apiClient;
  final SecureStorageService _storage;

  AuthNotifier(this._apiClient, this._storage) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final hasSession = await _storage.hasSession();
    if (hasSession) {
      final userId = await _storage.getUserId();
      final deviceId = await _storage.getDeviceId();
      final handle = await _storage.getHandle();
      state = AuthState(
        status: AuthStatus.authenticated,
        userId: userId,
        deviceId: deviceId,
        handle: handle,
      );
    } else {
      state = const AuthState(status: AuthStatus.unauthenticated);
    }
  }

  Future<bool> login({
    required String handle,
    required String password,
  }) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      // Check if we have existing identity keys
      String? identityKeyPub = await _storage.getIdentityPublicKey();
      int? registrationId = await _storage.getRegistrationId();

      // If no keys exist, generate new ones
      if (identityKeyPub == null || registrationId == null) {
        final keyPair = await IdentityKeyService.generateIdentityKeyPair();
        identityKeyPub = keyPair.publicKey;
        registrationId = keyPair.registrationId;

        // Save identity keys
        await _storage.saveIdentityKeys(
          privateKey: keyPair.privateKey,
          publicKey: keyPair.publicKey,
          registrationId: keyPair.registrationId,
        );
      }

      // Get device name
      final deviceName = await _getDeviceName();

      // Call login API
      final response = await _apiClient.login(
        handle: handle,
        password: password,
        deviceName: deviceName,
        identityKeyPub: identityKeyPub,
        registrationId: registrationId,
      );

      // Save tokens and user info
      await _storage.saveTokens(
        accessToken: response['accessToken'],
        refreshToken: response['refreshToken'],
      );

      await _storage.saveUserInfo(
        userId: response['userId'],
        deviceId: response['deviceId'],
        handle: handle,
      );

      state = AuthState(
        status: AuthStatus.authenticated,
        userId: response['userId'],
        deviceId: response['deviceId'],
        handle: handle,
      );

      return true;
    } on DioException catch (e) {
      String errorMessage = 'Login failed';

      if (e.response != null) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMessage = data['message'].toString();
        } else if (e.response?.statusCode == 401) {
          errorMessage = 'Invalid handle or password';
        } else if (e.response?.statusCode == 429) {
          errorMessage = 'Too many attempts. Please try again later.';
        }
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout. Please check your internet.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Could not connect to server';
      }

      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: errorMessage,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'An unexpected error occurred',
      );
      return false;
    }
  }

  Future<bool> register({
    required String handle,
    required String password,
  }) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      // Generate identity keys
      final keyPair = await IdentityKeyService.generateIdentityKeyPair();

      // Save identity keys locally
      await _storage.saveIdentityKeys(
        privateKey: keyPair.privateKey,
        publicKey: keyPair.publicKey,
        registrationId: keyPair.registrationId,
      );

      // Get device name
      final deviceName = await _getDeviceName();

      // Call register API
      final response = await _apiClient.register(
        handle: handle,
        password: password,
        deviceName: deviceName,
        identityKeyPub: keyPair.publicKey,
        registrationId: keyPair.registrationId,
      );

      // Save tokens and user info
      await _storage.saveTokens(
        accessToken: response['accessToken'],
        refreshToken: response['refreshToken'],
      );

      await _storage.saveUserInfo(
        userId: response['userId'],
        deviceId: response['deviceId'],
        handle: handle,
      );

      // Upload initial prekeys
      await _uploadInitialPrekeys();

      state = AuthState(
        status: AuthStatus.authenticated,
        userId: response['userId'],
        deviceId: response['deviceId'],
        handle: handle,
      );

      return true;
    } on DioException catch (e) {
      String errorMessage = 'Registration failed';

      if (e.response != null) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMessage = data['message'].toString();
        } else if (e.response?.statusCode == 409) {
          errorMessage = 'This handle is already taken';
        }
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Could not connect to server';
      }

      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: errorMessage,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'An unexpected error occurred',
      );
      return false;
    }
  }

  Future<void> _uploadInitialPrekeys() async {
    try {
      final identityPrivateKey = await _storage.getIdentityPrivateKey();
      if (identityPrivateKey == null) return;

      // Generate and upload signed prekey
      final signedPrekey = await IdentityKeyService.generateSignedPrekey(
        identityPrivateKey: identityPrivateKey,
        keyId: 1,
      );

      await _apiClient.uploadSignedPrekey(
        keyId: signedPrekey['keyId'],
        publicKey: signedPrekey['publicKey'],
        signature: signedPrekey['signature'],
      );

      // Generate and upload one-time prekeys
      final oneTimePrekeys = await IdentityKeyService.generateOneTimePrekeys(
        startKeyId: 1,
        count: 100,
      );

      await _apiClient.uploadOneTimePrekeys(
        oneTimePrekeys.map((pk) => {
          'keyId': pk['keyId'],
          'publicKey': pk['publicKey'],
        }).toList(),
      );
    } catch (e) {
      // Prekey upload failure is not critical for auth
      // Keys can be uploaded later
    }
  }

  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _apiClient.logout();
    } catch (e) {
      // Ignore logout API errors
    }

    await _storage.clearTokens();
    await _storage.clearUserInfo();

    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  Future<String> _getDeviceName() async {
    // TODO: Get actual device name using device_info_plus
    return 'Flutter App';
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

// Providers
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthNotifier(apiClient, storage);
});

// Convenience provider for checking auth status
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.status == AuthStatus.authenticated;
});
