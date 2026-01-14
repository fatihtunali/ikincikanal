// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnCredentialsImpl _$$TurnCredentialsImplFromJson(
  Map<String, dynamic> json,
) => _$TurnCredentialsImpl(
  urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
  username: json['username'] as String,
  credential: json['credential'] as String,
  ttlSeconds: (json['ttlSeconds'] as num).toInt(),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  iceTransportPolicy: json['iceTransportPolicy'] as String? ?? 'relay',
);

Map<String, dynamic> _$$TurnCredentialsImplToJson(
  _$TurnCredentialsImpl instance,
) => <String, dynamic>{
  'urls': instance.urls,
  'username': instance.username,
  'credential': instance.credential,
  'ttlSeconds': instance.ttlSeconds,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'iceTransportPolicy': instance.iceTransportPolicy,
};
