import 'package:dio/dio.dart';
import '../../models/models.dart';

class DeviceService {
  final Dio _dio;

  DeviceService(this._dio);

  /// List all devices for current user
  Future<List<Device>> listDevices() async {
    final response = await _dio.get('/devices');
    final devices = response.data['devices'] as List;
    return devices.map((d) => Device.fromJson(d)).toList();
  }

  /// Add a new device
  Future<Device> addDevice(AddDeviceRequest request) async {
    final response = await _dio.post('/devices', data: request.toJson());
    return Device.fromJson(response.data);
  }

  /// Revoke/logout a specific device
  Future<void> revokeDevice(String deviceId) async {
    await _dio.delete('/devices/$deviceId');
  }

  /// Revoke all devices except current
  Future<int> revokeAllDevices() async {
    final response = await _dio.post('/devices/revoke-all');
    return response.data['revokedCount'] as int;
  }

  /// Revoke all devices including current (logout everywhere)
  Future<void> revokeAllIncludingCurrent() async {
    await _dio.post('/devices/revoke-all-including-current');
  }
}
