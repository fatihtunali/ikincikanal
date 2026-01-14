/// Abstract interface for secure storage operations.
/// Platform-specific implementations should extend this class.
abstract class SecureStorageInterface {
  // ==========================================================================
  // Auth Tokens
  // ==========================================================================

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> clearTokens();

  // ==========================================================================
  // User Info
  // ==========================================================================

  Future<void> saveUserInfo({
    required String userId,
    required String deviceId,
    required String handle,
  });

  Future<String?> getUserId();

  Future<String?> getDeviceId();

  Future<String?> getHandle();

  Future<void> clearUserInfo();

  // ==========================================================================
  // Identity Keys (Signal Protocol)
  // ==========================================================================

  Future<void> saveIdentityKeys({
    required String privateKey,
    required String publicKey,
    required int registrationId,
  });

  Future<String?> getIdentityPrivateKey();

  Future<String?> getIdentityPublicKey();

  Future<int?> getRegistrationId();

  Future<void> clearIdentityKeys();

  // ==========================================================================
  // Clear All
  // ==========================================================================

  Future<void> clearAll();

  Future<bool> hasSession();
}
