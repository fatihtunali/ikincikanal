import 'package:freezed_annotation/freezed_annotation.dart';
import '../device/device.dart';
import '../keys/prekey.dart';
import 'passkey_attestation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String handle,
    String? password,
    PasskeyAttestation? passkey,
    required DeviceBootstrap device,
    required InitialKeys keys,
    required String acceptedPrivacyVersion,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
class PasswordLoginRequest with _$PasswordLoginRequest {
  const factory PasswordLoginRequest({
    required String handle,
    required String password,
    String? deviceId,
    DeviceBootstrap? newDevice,
    InitialKeys? newDeviceKeys,
  }) = _PasswordLoginRequest;

  factory PasswordLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordLoginRequestFromJson(json);
}
