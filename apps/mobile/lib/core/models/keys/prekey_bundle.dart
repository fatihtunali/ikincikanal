import 'package:freezed_annotation/freezed_annotation.dart';
import 'prekey.dart';

part 'prekey_bundle.freezed.dart';
part 'prekey_bundle.g.dart';

@freezed
class PreKeyBundle with _$PreKeyBundle {
  const factory PreKeyBundle({
    required String userId,
    required String deviceId,
    required int registrationId,
    required String identityKeyPub,
    required SignedPreKey signedPreKey,
    OneTimePreKey? oneTimePreKey,
  }) = _PreKeyBundle;

  factory PreKeyBundle.fromJson(Map<String, dynamic> json) =>
      _$PreKeyBundleFromJson(json);
}

@freezed
class KeyCountResponse with _$KeyCountResponse {
  const factory KeyCountResponse({
    required int oneTimeKeyCount,
    required int recommendedMinimum,
  }) = _KeyCountResponse;

  factory KeyCountResponse.fromJson(Map<String, dynamic> json) =>
      _$KeyCountResponseFromJson(json);
}

@freezed
class UploadKeysResponse with _$UploadKeysResponse {
  const factory UploadKeysResponse({
    required bool ok,
    required int remainingOneTimeKeys,
    required DateTime serverTime,
  }) = _UploadKeysResponse;

  factory UploadKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadKeysResponseFromJson(json);
}
