// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthResponseImpl _$$HealthResponseImplFromJson(Map<String, dynamic> json) =>
    _$HealthResponseImpl(
      ok: json['ok'] as bool,
      service: json['service'] as String,
      version: json['version'] as String,
      time: DateTime.parse(json['time'] as String),
      federation: FederationStatus.fromJson(
        json['federation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$HealthResponseImplToJson(
  _$HealthResponseImpl instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'service': instance.service,
  'version': instance.version,
  'time': instance.time.toIso8601String(),
  'federation': instance.federation,
};

_$FederationStatusImpl _$$FederationStatusImplFromJson(
  Map<String, dynamic> json,
) => _$FederationStatusImpl(
  enabled: json['enabled'] as bool,
  serverHandle: json['serverHandle'] as String,
  connectedServers: (json['connectedServers'] as num).toInt(),
);

Map<String, dynamic> _$$FederationStatusImplToJson(
  _$FederationStatusImpl instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'serverHandle': instance.serverHandle,
  'connectedServers': instance.connectedServers,
};
