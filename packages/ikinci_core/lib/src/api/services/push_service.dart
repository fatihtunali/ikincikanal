import 'package:dio/dio.dart';
import '../../models/models.dart';

class PushService {
  final Dio _dio;

  PushService(this._dio);

  /// Register or update push notification token
  Future<void> upsertPushToken(UpsertPushTokenRequest request) async {
    await _dio.put('/push/token', data: request.toJson());
  }

  /// Remove push token (disable notifications)
  Future<void> deletePushToken() async {
    await _dio.delete('/push/token');
  }
}
