import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage.dart';

/// @deprecated Use services from api_providers.dart instead
/// This class is kept for backwards compatibility during migration
class ApiClient {
  final Dio _dio;
  final SecureStorageService _storage;

  ApiClient(this._dio, this._storage) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // Try to refresh token
          final refreshed = await _refreshToken();
          if (refreshed) {
            // Retry the request
            final options = error.requestOptions;
            final token = await _storage.getAccessToken();
            options.headers['Authorization'] = 'Bearer $token';
            try {
              final response = await _dio.fetch(options);
              return handler.resolve(response);
            } catch (e) {
              return handler.reject(error);
            }
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      await _storage.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // ==========================================================================
  // Auth
  // ==========================================================================

  Future<Map<String, dynamic>> register({
    required String handle,
    required String password,
    required String deviceName,
    required String identityKeyPub,
    required int registrationId,
  }) async {
    final response = await _dio.post('/auth/register', data: {
      'handle': handle,
      'password': password,
      'deviceName': deviceName,
      'identityKeyPub': identityKeyPub,
      'registrationId': registrationId,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> login({
    required String handle,
    required String password,
    required String deviceName,
    required String identityKeyPub,
    required int registrationId,
  }) async {
    final response = await _dio.post('/auth/login', data: {
      'handle': handle,
      'password': password,
      'deviceName': deviceName,
      'identityKeyPub': identityKeyPub,
      'registrationId': registrationId,
    });
    return response.data;
  }

  Future<void> logout() async {
    await _dio.post('/auth/logout');
  }

  // ==========================================================================
  // Keys
  // ==========================================================================

  Future<void> uploadSignedPrekey({
    required int keyId,
    required String publicKey,
    required String signature,
  }) async {
    await _dio.post('/keys/signed-prekey', data: {
      'keyId': keyId,
      'publicKey': publicKey,
      'signature': signature,
    });
  }

  Future<void> uploadOneTimePrekeys(List<Map<String, dynamic>> prekeys) async {
    await _dio.post('/keys/one-time-prekeys', data: {
      'prekeys': prekeys,
    });
  }

  Future<Map<String, dynamic>> getKeyBundle(String userId) async {
    final response = await _dio.get('/keys/bundle/$userId');
    return response.data;
  }

  // ==========================================================================
  // Messages
  // ==========================================================================

  Future<List<Map<String, dynamic>>> sendMessage({
    required String toUserId,
    required List<Map<String, dynamic>> destinations,
    required String clientMessageId,
    required String envelopeType,
    int? disappearingSeconds,
  }) async {
    final response = await _dio.post('/messages/send', data: {
      'toUserId': toUserId,
      'destinations': destinations,
      'clientMessageId': clientMessageId,
      'envelopeType': envelopeType,
      if (disappearingSeconds != null) 'disappearingSeconds': disappearingSeconds,
    });
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> getPendingMessages({
    int limit = 100,
    int waitSeconds = 0,
  }) async {
    final response = await _dio.get('/messages/pending', queryParameters: {
      'limit': limit,
      'waitSeconds': waitSeconds,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> acknowledgeMessages(List<String> messageIds) async {
    final response = await _dio.post('/messages/ack', data: {
      'serverMessageIds': messageIds,
    });
    return response.data;
  }

  // ==========================================================================
  // Users
  // ==========================================================================

  Future<Map<String, dynamic>> resolveUser(String handle) async {
    final response = await _dio.post('/users/resolve', data: {
      'handle': handle,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get('/me');
    return response.data;
  }

  Future<void> updateProfile({String? displayName}) async {
    await _dio.put('/me', data: {
      if (displayName != null) 'displayName': displayName,
    });
  }
}

/// @deprecated Use dioProvider from api_providers.dart instead
final legacyDioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://api.itinerarytemplate.com',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
    },
  ));
});

/// @deprecated Use service providers from api_providers.dart instead
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(legacyDioProvider);
  final storage = ref.watch(secureStorageProvider);
  return ApiClient(dio, storage);
});
