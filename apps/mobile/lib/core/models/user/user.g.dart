// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  handle: json['handle'] as String,
  fullHandle: json['fullHandle'] as String,
  homeServer: json['homeServer'] as String,
  displayName: json['displayName'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  status: json['status'] as String? ?? 'active',
  settings: json['settings'] == null
      ? null
      : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'handle': instance.handle,
      'fullHandle': instance.fullHandle,
      'homeServer': instance.homeServer,
      'displayName': instance.displayName,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'settings': instance.settings,
    };

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      defaultDisappearingSeconds: (json['defaultDisappearingSeconds'] as num?)
          ?.toInt(),
      allowSealedSender: json['allowSealedSender'] as bool? ?? true,
      readReceipts: json['readReceipts'] as bool? ?? false,
      typingIndicators: json['typingIndicators'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'defaultDisappearingSeconds': instance.defaultDisappearingSeconds,
      'allowSealedSender': instance.allowSealedSender,
      'readReceipts': instance.readReceipts,
      'typingIndicators': instance.typingIndicators,
    };

_$UserResolveResponseImpl _$$UserResolveResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserResolveResponseImpl(
  id: json['id'] as String,
  handle: json['handle'] as String,
  fullHandle: json['fullHandle'] as String,
  homeServer: json['homeServer'] as String,
  hasDevice: json['hasDevice'] as bool,
  isFederated: json['isFederated'] as bool,
);

Map<String, dynamic> _$$UserResolveResponseImplToJson(
  _$UserResolveResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'handle': instance.handle,
  'fullHandle': instance.fullHandle,
  'homeServer': instance.homeServer,
  'hasDevice': instance.hasDevice,
  'isFederated': instance.isFederated,
};

_$UpdateProfileRequestImpl _$$UpdateProfileRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateProfileRequestImpl(
  displayName: json['displayName'] as String?,
  settings: json['settings'] == null
      ? null
      : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UpdateProfileRequestImplToJson(
  _$UpdateProfileRequestImpl instance,
) => <String, dynamic>{
  'displayName': instance.displayName,
  'settings': instance.settings,
};
