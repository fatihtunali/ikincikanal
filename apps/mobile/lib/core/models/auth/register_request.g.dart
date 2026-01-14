// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  handle: json['handle'] as String,
  password: json['password'] as String?,
  passkey: json['passkey'] == null
      ? null
      : PasskeyAttestation.fromJson(json['passkey'] as Map<String, dynamic>),
  device: DeviceBootstrap.fromJson(json['device'] as Map<String, dynamic>),
  keys: InitialKeys.fromJson(json['keys'] as Map<String, dynamic>),
  acceptedPrivacyVersion: json['acceptedPrivacyVersion'] as String,
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'handle': instance.handle,
  'password': instance.password,
  'passkey': instance.passkey,
  'device': instance.device,
  'keys': instance.keys,
  'acceptedPrivacyVersion': instance.acceptedPrivacyVersion,
};

_$PasswordLoginRequestImpl _$$PasswordLoginRequestImplFromJson(
  Map<String, dynamic> json,
) => _$PasswordLoginRequestImpl(
  handle: json['handle'] as String,
  password: json['password'] as String,
  deviceId: json['deviceId'] as String?,
  newDevice: json['newDevice'] == null
      ? null
      : DeviceBootstrap.fromJson(json['newDevice'] as Map<String, dynamic>),
  newDeviceKeys: json['newDeviceKeys'] == null
      ? null
      : InitialKeys.fromJson(json['newDeviceKeys'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PasswordLoginRequestImplToJson(
  _$PasswordLoginRequestImpl instance,
) => <String, dynamic>{
  'handle': instance.handle,
  'password': instance.password,
  'deviceId': instance.deviceId,
  'newDevice': instance.newDevice,
  'newDeviceKeys': instance.newDeviceKeys,
};
