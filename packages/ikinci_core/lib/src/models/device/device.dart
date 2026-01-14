import 'package:freezed_annotation/freezed_annotation.dart';
import '../keys/prekey.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required String id,
    required String userId,
    required String deviceName,
    required int registrationId,
    required String identityKeyPub,
    required DateTime createdAt,
    required DateTime lastActiveAt,
    DateTime? revokedAt,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
class DeviceBootstrap with _$DeviceBootstrap {
  const factory DeviceBootstrap({
    required String deviceName,
    required int registrationId,
    required String identityKeyPub,
  }) = _DeviceBootstrap;

  factory DeviceBootstrap.fromJson(Map<String, dynamic> json) =>
      _$DeviceBootstrapFromJson(json);
}

@freezed
class AddDeviceRequest with _$AddDeviceRequest {
  const factory AddDeviceRequest({
    required DeviceBootstrap device,
    required InitialKeys keys,
  }) = _AddDeviceRequest;

  factory AddDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddDeviceRequestFromJson(json);
}
