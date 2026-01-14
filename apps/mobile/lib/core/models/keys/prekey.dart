import 'package:freezed_annotation/freezed_annotation.dart';

part 'prekey.freezed.dart';
part 'prekey.g.dart';

@freezed
class SignedPreKey with _$SignedPreKey {
  const factory SignedPreKey({
    required int keyId,
    required String publicKey,
    required String signature,
  }) = _SignedPreKey;

  factory SignedPreKey.fromJson(Map<String, dynamic> json) =>
      _$SignedPreKeyFromJson(json);
}

@freezed
class OneTimePreKey with _$OneTimePreKey {
  const factory OneTimePreKey({
    required int keyId,
    required String publicKey,
  }) = _OneTimePreKey;

  factory OneTimePreKey.fromJson(Map<String, dynamic> json) =>
      _$OneTimePreKeyFromJson(json);
}

@freezed
class InitialKeys with _$InitialKeys {
  const factory InitialKeys({
    required SignedPreKey signedPreKey,
    required List<OneTimePreKey> oneTimePreKeys,
  }) = _InitialKeys;

  factory InitialKeys.fromJson(Map<String, dynamic> json) =>
      _$InitialKeysFromJson(json);
}

@freezed
class UploadKeysRequest with _$UploadKeysRequest {
  const factory UploadKeysRequest({
    required SignedPreKey signedPreKey,
    required List<OneTimePreKey> oneTimePreKeys,
  }) = _UploadKeysRequest;

  factory UploadKeysRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadKeysRequestFromJson(json);
}
