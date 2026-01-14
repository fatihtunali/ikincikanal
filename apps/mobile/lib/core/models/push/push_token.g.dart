// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpsertPushTokenRequestImpl _$$UpsertPushTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpsertPushTokenRequestImpl(
  provider: json['provider'] as String,
  token: json['token'] as String,
  endpoint: json['endpoint'] as String?,
  appBundleId: json['appBundleId'] as String?,
);

Map<String, dynamic> _$$UpsertPushTokenRequestImplToJson(
  _$UpsertPushTokenRequestImpl instance,
) => <String, dynamic>{
  'provider': instance.provider,
  'token': instance.token,
  'endpoint': instance.endpoint,
  'appBundleId': instance.appBundleId,
};
