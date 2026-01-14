import 'package:dio/dio.dart';
import '../../models/models.dart';

class KeysService {
  final Dio _dio;

  KeysService(this._dio);

  /// Get prekey bundle for a user (for session establishment)
  Future<PreKeyBundle> getPrekeyBundle(String userId, {String? deviceId}) async {
    final response = await _dio.get(
      '/keys/prekey-bundle/$userId',
      queryParameters: {
        if (deviceId != null) 'deviceId': deviceId,
      },
    );
    return PreKeyBundle.fromJson(response.data);
  }

  /// Upload signed prekey and one-time prekeys
  Future<UploadKeysResponse> uploadKeys(UploadKeysRequest request) async {
    final response = await _dio.post('/keys/upload', data: request.toJson());
    return UploadKeysResponse.fromJson(response.data);
  }

  /// Get count of remaining one-time prekeys
  Future<KeyCountResponse> getKeyCount() async {
    final response = await _dio.get('/keys/count');
    return KeyCountResponse.fromJson(response.data);
  }
}
