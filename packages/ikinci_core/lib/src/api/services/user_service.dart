import 'package:dio/dio.dart';
import '../../models/models.dart';

class UserService {
  final Dio _dio;

  UserService(this._dio);

  /// Get current user profile
  Future<User> getProfile() async {
    final response = await _dio.get('/me');
    return User.fromJson(response.data);
  }

  /// Update profile
  Future<User> updateProfile(UpdateProfileRequest request) async {
    final response = await _dio.patch('/me', data: request.toJson());
    return User.fromJson(response.data);
  }

  /// Delete account
  Future<void> deleteAccount(DeleteAccountRequest request) async {
    await _dio.delete('/me', data: request.toJson());
  }

  /// Nuke account - initiate or confirm
  /// Returns NukeInitiatedResponse for standard mode initiation
  /// Returns null for completion (204 response)
  Future<NukeInitiatedResponse?> nukeAccount(NukeRequest request) async {
    final response = await _dio.post('/me/nuke', data: request.toJson());
    if (response.statusCode == 200) {
      return NukeInitiatedResponse.fromJson(response.data);
    }
    return null; // 204 = completed
  }

  /// Export user data (GDPR)
  Future<DataExport> exportData() async {
    final response = await _dio.get('/me/export');
    return DataExport.fromJson(response.data);
  }

  /// Get passkey registration options (add passkey to existing account)
  Future<PasskeyRegistrationOptions> getPasskeyRegistrationOptions({
    String? deviceName,
  }) async {
    final response = await _dio.post('/me/passkey/options', data: {
      if (deviceName != null) 'deviceName': deviceName,
    });
    return PasskeyRegistrationOptions.fromJson(response.data);
  }

  /// Add passkey to account
  Future<void> addPasskey(PasskeyAttestation attestation) async {
    await _dio.post('/me/passkey', data: {
      'attestation': attestation.toJson(),
    });
  }

  /// Resolve user by handle
  Future<UserResolveResponse> resolveUser(String handle) async {
    final response = await _dio.post('/users/resolve', data: {
      'handle': handle,
    });
    return UserResolveResponse.fromJson(response.data);
  }
}
