// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_attestation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasskeyAttestationImpl _$$PasskeyAttestationImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyAttestationImpl(
  id: json['id'] as String,
  rawId: json['rawId'] as String,
  type: json['type'] as String,
  response: PasskeyAttestationResponse.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
  authenticatorAttachment: json['authenticatorAttachment'] as String?,
);

Map<String, dynamic> _$$PasskeyAttestationImplToJson(
  _$PasskeyAttestationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'rawId': instance.rawId,
  'type': instance.type,
  'response': instance.response,
  'authenticatorAttachment': instance.authenticatorAttachment,
};

_$PasskeyAttestationResponseImpl _$$PasskeyAttestationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyAttestationResponseImpl(
  clientDataJSON: json['clientDataJSON'] as String,
  attestationObject: json['attestationObject'] as String,
  transports: (json['transports'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$PasskeyAttestationResponseImplToJson(
  _$PasskeyAttestationResponseImpl instance,
) => <String, dynamic>{
  'clientDataJSON': instance.clientDataJSON,
  'attestationObject': instance.attestationObject,
  'transports': instance.transports,
};

_$PasskeyAssertionImpl _$$PasskeyAssertionImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyAssertionImpl(
  id: json['id'] as String,
  rawId: json['rawId'] as String,
  type: json['type'] as String,
  response: PasskeyAssertionResponse.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
  authenticatorAttachment: json['authenticatorAttachment'] as String?,
);

Map<String, dynamic> _$$PasskeyAssertionImplToJson(
  _$PasskeyAssertionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'rawId': instance.rawId,
  'type': instance.type,
  'response': instance.response,
  'authenticatorAttachment': instance.authenticatorAttachment,
};

_$PasskeyAssertionResponseImpl _$$PasskeyAssertionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyAssertionResponseImpl(
  clientDataJSON: json['clientDataJSON'] as String,
  authenticatorData: json['authenticatorData'] as String,
  signature: json['signature'] as String,
  userHandle: json['userHandle'] as String?,
);

Map<String, dynamic> _$$PasskeyAssertionResponseImplToJson(
  _$PasskeyAssertionResponseImpl instance,
) => <String, dynamic>{
  'clientDataJSON': instance.clientDataJSON,
  'authenticatorData': instance.authenticatorData,
  'signature': instance.signature,
  'userHandle': instance.userHandle,
};
