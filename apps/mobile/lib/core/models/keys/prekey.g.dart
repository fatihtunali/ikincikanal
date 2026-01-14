// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prekey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignedPreKeyImpl _$$SignedPreKeyImplFromJson(Map<String, dynamic> json) =>
    _$SignedPreKeyImpl(
      keyId: (json['keyId'] as num).toInt(),
      publicKey: json['publicKey'] as String,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$$SignedPreKeyImplToJson(_$SignedPreKeyImpl instance) =>
    <String, dynamic>{
      'keyId': instance.keyId,
      'publicKey': instance.publicKey,
      'signature': instance.signature,
    };

_$OneTimePreKeyImpl _$$OneTimePreKeyImplFromJson(Map<String, dynamic> json) =>
    _$OneTimePreKeyImpl(
      keyId: (json['keyId'] as num).toInt(),
      publicKey: json['publicKey'] as String,
    );

Map<String, dynamic> _$$OneTimePreKeyImplToJson(_$OneTimePreKeyImpl instance) =>
    <String, dynamic>{'keyId': instance.keyId, 'publicKey': instance.publicKey};

_$InitialKeysImpl _$$InitialKeysImplFromJson(Map<String, dynamic> json) =>
    _$InitialKeysImpl(
      signedPreKey: SignedPreKey.fromJson(
        json['signedPreKey'] as Map<String, dynamic>,
      ),
      oneTimePreKeys: (json['oneTimePreKeys'] as List<dynamic>)
          .map((e) => OneTimePreKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InitialKeysImplToJson(_$InitialKeysImpl instance) =>
    <String, dynamic>{
      'signedPreKey': instance.signedPreKey,
      'oneTimePreKeys': instance.oneTimePreKeys,
    };

_$UploadKeysRequestImpl _$$UploadKeysRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UploadKeysRequestImpl(
  signedPreKey: SignedPreKey.fromJson(
    json['signedPreKey'] as Map<String, dynamic>,
  ),
  oneTimePreKeys: (json['oneTimePreKeys'] as List<dynamic>)
      .map((e) => OneTimePreKey.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UploadKeysRequestImplToJson(
  _$UploadKeysRequestImpl instance,
) => <String, dynamic>{
  'signedPreKey': instance.signedPreKey,
  'oneTimePreKeys': instance.oneTimePreKeys,
};
