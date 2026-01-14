// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  deviceName: json['deviceName'] as String,
  registrationId: (json['registrationId'] as num).toInt(),
  identityKeyPub: json['identityKeyPub'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
  revokedAt: json['revokedAt'] == null
      ? null
      : DateTime.parse(json['revokedAt'] as String),
);

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceName': instance.deviceName,
      'registrationId': instance.registrationId,
      'identityKeyPub': instance.identityKeyPub,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt.toIso8601String(),
      'revokedAt': instance.revokedAt?.toIso8601String(),
    };

_$DeviceBootstrapImpl _$$DeviceBootstrapImplFromJson(
  Map<String, dynamic> json,
) => _$DeviceBootstrapImpl(
  deviceName: json['deviceName'] as String,
  registrationId: (json['registrationId'] as num).toInt(),
  identityKeyPub: json['identityKeyPub'] as String,
);

Map<String, dynamic> _$$DeviceBootstrapImplToJson(
  _$DeviceBootstrapImpl instance,
) => <String, dynamic>{
  'deviceName': instance.deviceName,
  'registrationId': instance.registrationId,
  'identityKeyPub': instance.identityKeyPub,
};

_$AddDeviceRequestImpl _$$AddDeviceRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AddDeviceRequestImpl(
  device: DeviceBootstrap.fromJson(json['device'] as Map<String, dynamic>),
  keys: InitialKeys.fromJson(json['keys'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AddDeviceRequestImplToJson(
  _$AddDeviceRequestImpl instance,
) => <String, dynamic>{'device': instance.device, 'keys': instance.keys};
