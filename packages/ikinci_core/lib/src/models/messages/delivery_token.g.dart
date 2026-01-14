// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryTokenImpl _$$DeliveryTokenImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryTokenImpl(
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      forUserId: json['forUserId'] as String?,
    );

Map<String, dynamic> _$$DeliveryTokenImplToJson(_$DeliveryTokenImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'forUserId': instance.forUserId,
    };

_$CreateDeliveryTokenRequestImpl _$$CreateDeliveryTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateDeliveryTokenRequestImpl(
  forSenderType: json['forSenderType'] as String,
  forSenderValue: json['forSenderValue'] as String,
  expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 3600,
  maxPayloadBytes: (json['maxPayloadBytes'] as num?)?.toInt() ?? 65536,
  requireProofOfWork: json['requireProofOfWork'] as bool? ?? false,
);

Map<String, dynamic> _$$CreateDeliveryTokenRequestImplToJson(
  _$CreateDeliveryTokenRequestImpl instance,
) => <String, dynamic>{
  'forSenderType': instance.forSenderType,
  'forSenderValue': instance.forSenderValue,
  'expiresInSeconds': instance.expiresInSeconds,
  'maxPayloadBytes': instance.maxPayloadBytes,
  'requireProofOfWork': instance.requireProofOfWork,
};
