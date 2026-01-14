import 'package:dio/dio.dart';
import '../../models/models.dart';

class HealthService {
  final Dio _dio;

  HealthService(this._dio);

  /// Check server health and federation status
  Future<HealthResponse> checkHealth() async {
    final response = await _dio.get('/health');
    return HealthResponse.fromJson(response.data);
  }
}
