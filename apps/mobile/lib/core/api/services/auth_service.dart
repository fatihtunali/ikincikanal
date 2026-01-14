import 'package:dio/dio.dart';
import '../../models/models.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  /// Register with password
  Future<AuthResponse> register(RegisterRequest request) async {
    final response = await _dio.post('/auth/register', data: request.toJson());
    return AuthResponse.fromJson(response.data);
  }

  /// Login with password
  Future<AuthResponse> login(PasswordLoginRequest request) async {
    final response = await _dio.post('/auth/login', data: request.toJson());
    return AuthResponse.fromJson(response.data);
  }

  /// Get passkey login options (step 1)
  Future<PasskeyLoginOptions> getPasskeyLoginOptions(String handle) async {
    final response = await _dio.post(
      '/auth/passkey/options',
      data: {'handle': handle},
    );
    return PasskeyLoginOptions.fromJson(response.data);
  }

  /// Verify passkey login (step 2)
  Future<AuthResponse> verifyPasskeyLogin({
    required String handle,
    required PasskeyAssertion assertion,
    DeviceBootstrap? device,
    InitialKeys? deviceKeys,
  }) async {
    final response = await _dio.post('/auth/passkey/verify', data: {
      'handle': handle,
      'assertion': assertion.toJson(),
      if (device != null) 'device': device.toJson(),
      if (deviceKeys != null) 'deviceKeys': deviceKeys.toJson(),
    });
    return AuthResponse.fromJson(response.data);
  }

  /// Refresh access token
  Future<AuthResponse> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    return AuthResponse.fromJson(response.data);
  }

  /// Logout current session
  Future<void> logout() async {
    await _dio.post('/auth/logout');
  }
}
