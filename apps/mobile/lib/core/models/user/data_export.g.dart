// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_export.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataExportImpl _$$DataExportImplFromJson(Map<String, dynamic> json) =>
    _$DataExportImpl(
      exportedAt: DateTime.parse(json['exportedAt'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageCount: (json['messageCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DataExportImplToJson(_$DataExportImpl instance) =>
    <String, dynamic>{
      'exportedAt': instance.exportedAt.toIso8601String(),
      'user': instance.user,
      'devices': instance.devices,
      'messageCount': instance.messageCount,
    };
