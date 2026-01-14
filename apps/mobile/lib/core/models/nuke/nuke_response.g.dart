// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nuke_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NukeInitiatedResponseImpl _$$NukeInitiatedResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NukeInitiatedResponseImpl(
  nukeToken: json['nukeToken'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  countdown: (json['countdown'] as num).toInt(),
);

Map<String, dynamic> _$$NukeInitiatedResponseImplToJson(
  _$NukeInitiatedResponseImpl instance,
) => <String, dynamic>{
  'nukeToken': instance.nukeToken,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'countdown': instance.countdown,
};

_$NukeRequestImpl _$$NukeRequestImplFromJson(Map<String, dynamic> json) =>
    _$NukeRequestImpl(
      mode: json['mode'] as String? ?? 'standard',
      nukeToken: json['nukeToken'] as String?,
      deviceKeySignature: json['deviceKeySignature'] as String?,
    );

Map<String, dynamic> _$$NukeRequestImplToJson(_$NukeRequestImpl instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'nukeToken': instance.nukeToken,
      'deviceKeySignature': instance.deviceKeySignature,
    };

_$DeleteAccountRequestImpl _$$DeleteAccountRequestImplFromJson(
  Map<String, dynamic> json,
) => _$DeleteAccountRequestImpl(
  password: json['password'] as String?,
  confirmation: json['confirmation'] as String,
);

Map<String, dynamic> _$$DeleteAccountRequestImplToJson(
  _$DeleteAccountRequestImpl instance,
) => <String, dynamic>{
  'password': instance.password,
  'confirmation': instance.confirmation,
};
