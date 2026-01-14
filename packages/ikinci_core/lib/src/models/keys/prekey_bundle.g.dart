// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prekey_bundle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreKeyBundleImpl _$$PreKeyBundleImplFromJson(Map<String, dynamic> json) =>
    _$PreKeyBundleImpl(
      userId: json['userId'] as String,
      deviceId: json['deviceId'] as String,
      registrationId: (json['registrationId'] as num).toInt(),
      identityKeyPub: json['identityKeyPub'] as String,
      signedPreKey: SignedPreKey.fromJson(
        json['signedPreKey'] as Map<String, dynamic>,
      ),
      oneTimePreKey: json['oneTimePreKey'] == null
          ? null
          : OneTimePreKey.fromJson(
              json['oneTimePreKey'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$PreKeyBundleImplToJson(_$PreKeyBundleImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'registrationId': instance.registrationId,
      'identityKeyPub': instance.identityKeyPub,
      'signedPreKey': instance.signedPreKey,
      'oneTimePreKey': instance.oneTimePreKey,
    };

_$KeyCountResponseImpl _$$KeyCountResponseImplFromJson(
  Map<String, dynamic> json,
) => _$KeyCountResponseImpl(
  oneTimeKeyCount: (json['oneTimeKeyCount'] as num).toInt(),
  recommendedMinimum: (json['recommendedMinimum'] as num).toInt(),
);

Map<String, dynamic> _$$KeyCountResponseImplToJson(
  _$KeyCountResponseImpl instance,
) => <String, dynamic>{
  'oneTimeKeyCount': instance.oneTimeKeyCount,
  'recommendedMinimum': instance.recommendedMinimum,
};

_$UploadKeysResponseImpl _$$UploadKeysResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UploadKeysResponseImpl(
  ok: json['ok'] as bool,
  remainingOneTimeKeys: (json['remainingOneTimeKeys'] as num).toInt(),
  serverTime: DateTime.parse(json['serverTime'] as String),
);

Map<String, dynamic> _$$UploadKeysResponseImplToJson(
  _$UploadKeysResponseImpl instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'remainingOneTimeKeys': instance.remainingOneTimeKeys,
  'serverTime': instance.serverTime.toIso8601String(),
};
