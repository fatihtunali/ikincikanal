import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage_interface.dart';

/// Default implementation of [SecureStorageInterface] using FlutterSecureStorage.
/// Works on mobile (iOS/Android) and desktop platforms.
class SecureStorageService implements SecureStorageInterface {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  // Token keys
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userIdKey = 'user_id';
  static const _deviceIdKey = 'device_id';
  static const _handleKey = 'handle';

  // Identity keys
  static const _identityKeyPrivateKey = 'identity_key_private';
  static const _identityKeyPublicKey = 'identity_key_public';
  static const _registrationIdKey = 'registration_id';

  // ==========================================================================
  // Auth Tokens
  // ==========================================================================

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  // ==========================================================================
  // User Info
  // ==========================================================================

  @override
  Future<void> saveUserInfo({
    required String userId,
    required String deviceId,
    required String handle,
  }) async {
    await _storage.write(key: _userIdKey, value: userId);
    await _storage.write(key: _deviceIdKey, value: deviceId);
    await _storage.write(key: _handleKey, value: handle);
  }

  @override
  Future<String?> getUserId() async {
    return _storage.read(key: _userIdKey);
  }

  @override
  Future<String?> getDeviceId() async {
    return _storage.read(key: _deviceIdKey);
  }

  @override
  Future<String?> getHandle() async {
    return _storage.read(key: _handleKey);
  }

  @override
  Future<void> clearUserInfo() async {
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _deviceIdKey);
    await _storage.delete(key: _handleKey);
  }

  // ==========================================================================
  // Identity Keys (Signal Protocol)
  // ==========================================================================

  @override
  Future<void> saveIdentityKeys({
    required String privateKey,
    required String publicKey,
    required int registrationId,
  }) async {
    await _storage.write(key: _identityKeyPrivateKey, value: privateKey);
    await _storage.write(key: _identityKeyPublicKey, value: publicKey);
    await _storage.write(key: _registrationIdKey, value: registrationId.toString());
  }

  @override
  Future<String?> getIdentityPrivateKey() async {
    return _storage.read(key: _identityKeyPrivateKey);
  }

  @override
  Future<String?> getIdentityPublicKey() async {
    return _storage.read(key: _identityKeyPublicKey);
  }

  @override
  Future<int?> getRegistrationId() async {
    final value = await _storage.read(key: _registrationIdKey);
    return value != null ? int.parse(value) : null;
  }

  @override
  Future<void> clearIdentityKeys() async {
    await _storage.delete(key: _identityKeyPrivateKey);
    await _storage.delete(key: _identityKeyPublicKey);
    await _storage.delete(key: _registrationIdKey);
  }

  // ==========================================================================
  // Clear All
  // ==========================================================================

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> hasSession() async {
    final token = await getAccessToken();
    return token != null;
  }
}

/// Default provider using FlutterSecureStorage with platform-specific options.
final secureStorageProvider = Provider<SecureStorageService>((ref) {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  return SecureStorageService(storage);
});
