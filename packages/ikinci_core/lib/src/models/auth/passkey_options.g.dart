// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasskeyLoginOptionsImpl _$$PasskeyLoginOptionsImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyLoginOptionsImpl(
  challenge: json['challenge'] as String,
  timeout: (json['timeout'] as num).toInt(),
  rpId: json['rpId'] as String,
  allowCredentials: (json['allowCredentials'] as List<dynamic>)
      .map((e) => AllowCredential.fromJson(e as Map<String, dynamic>))
      .toList(),
  userVerification: json['userVerification'] as String? ?? 'preferred',
);

Map<String, dynamic> _$$PasskeyLoginOptionsImplToJson(
  _$PasskeyLoginOptionsImpl instance,
) => <String, dynamic>{
  'challenge': instance.challenge,
  'timeout': instance.timeout,
  'rpId': instance.rpId,
  'allowCredentials': instance.allowCredentials,
  'userVerification': instance.userVerification,
};

_$AllowCredentialImpl _$$AllowCredentialImplFromJson(
  Map<String, dynamic> json,
) => _$AllowCredentialImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  transports: (json['transports'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$AllowCredentialImplToJson(
  _$AllowCredentialImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'transports': instance.transports,
};

_$PasskeyRegistrationOptionsImpl _$$PasskeyRegistrationOptionsImplFromJson(
  Map<String, dynamic> json,
) => _$PasskeyRegistrationOptionsImpl(
  challenge: json['challenge'] as String,
  rp: RelyingParty.fromJson(json['rp'] as Map<String, dynamic>),
  user: PasskeyUser.fromJson(json['user'] as Map<String, dynamic>),
  pubKeyCredParams: (json['pubKeyCredParams'] as List<dynamic>)
      .map((e) => PubKeyCredParam.fromJson(e as Map<String, dynamic>))
      .toList(),
  timeout: (json['timeout'] as num).toInt(),
  authenticatorSelection: json['authenticatorSelection'] == null
      ? null
      : AuthenticatorSelection.fromJson(
          json['authenticatorSelection'] as Map<String, dynamic>,
        ),
  attestation: json['attestation'] as String? ?? 'none',
);

Map<String, dynamic> _$$PasskeyRegistrationOptionsImplToJson(
  _$PasskeyRegistrationOptionsImpl instance,
) => <String, dynamic>{
  'challenge': instance.challenge,
  'rp': instance.rp,
  'user': instance.user,
  'pubKeyCredParams': instance.pubKeyCredParams,
  'timeout': instance.timeout,
  'authenticatorSelection': instance.authenticatorSelection,
  'attestation': instance.attestation,
};

_$RelyingPartyImpl _$$RelyingPartyImplFromJson(Map<String, dynamic> json) =>
    _$RelyingPartyImpl(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$$RelyingPartyImplToJson(_$RelyingPartyImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$PasskeyUserImpl _$$PasskeyUserImplFromJson(Map<String, dynamic> json) =>
    _$PasskeyUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$$PasskeyUserImplToJson(_$PasskeyUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };

_$PubKeyCredParamImpl _$$PubKeyCredParamImplFromJson(
  Map<String, dynamic> json,
) => _$PubKeyCredParamImpl(
  type: json['type'] as String,
  alg: (json['alg'] as num).toInt(),
);

Map<String, dynamic> _$$PubKeyCredParamImplToJson(
  _$PubKeyCredParamImpl instance,
) => <String, dynamic>{'type': instance.type, 'alg': instance.alg};

_$AuthenticatorSelectionImpl _$$AuthenticatorSelectionImplFromJson(
  Map<String, dynamic> json,
) => _$AuthenticatorSelectionImpl(
  authenticatorAttachment: json['authenticatorAttachment'] as String?,
  residentKey: json['residentKey'] as String?,
  userVerification: json['userVerification'] as String?,
);

Map<String, dynamic> _$$AuthenticatorSelectionImplToJson(
  _$AuthenticatorSelectionImpl instance,
) => <String, dynamic>{
  'authenticatorAttachment': instance.authenticatorAttachment,
  'residentKey': instance.residentKey,
  'userVerification': instance.userVerification,
};
