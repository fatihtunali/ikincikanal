import 'package:freezed_annotation/freezed_annotation.dart';

part 'passkey_options.freezed.dart';
part 'passkey_options.g.dart';

@freezed
class PasskeyLoginOptions with _$PasskeyLoginOptions {
  const factory PasskeyLoginOptions({
    required String challenge,
    required int timeout,
    required String rpId,
    required List<AllowCredential> allowCredentials,
    @Default('preferred') String userVerification,
  }) = _PasskeyLoginOptions;

  factory PasskeyLoginOptions.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginOptionsFromJson(json);
}

@freezed
class AllowCredential with _$AllowCredential {
  const factory AllowCredential({
    required String id,
    required String type,
    List<String>? transports,
  }) = _AllowCredential;

  factory AllowCredential.fromJson(Map<String, dynamic> json) =>
      _$AllowCredentialFromJson(json);
}

@freezed
class PasskeyRegistrationOptions with _$PasskeyRegistrationOptions {
  const factory PasskeyRegistrationOptions({
    required String challenge,
    required RelyingParty rp,
    required PasskeyUser user,
    required List<PubKeyCredParam> pubKeyCredParams,
    required int timeout,
    AuthenticatorSelection? authenticatorSelection,
    @Default('none') String attestation,
  }) = _PasskeyRegistrationOptions;

  factory PasskeyRegistrationOptions.fromJson(Map<String, dynamic> json) =>
      _$PasskeyRegistrationOptionsFromJson(json);
}

@freezed
class RelyingParty with _$RelyingParty {
  const factory RelyingParty({
    required String id,
    required String name,
  }) = _RelyingParty;

  factory RelyingParty.fromJson(Map<String, dynamic> json) =>
      _$RelyingPartyFromJson(json);
}

@freezed
class PasskeyUser with _$PasskeyUser {
  const factory PasskeyUser({
    required String id,
    required String name,
    required String displayName,
  }) = _PasskeyUser;

  factory PasskeyUser.fromJson(Map<String, dynamic> json) =>
      _$PasskeyUserFromJson(json);
}

@freezed
class PubKeyCredParam with _$PubKeyCredParam {
  const factory PubKeyCredParam({
    required String type,
    required int alg,
  }) = _PubKeyCredParam;

  factory PubKeyCredParam.fromJson(Map<String, dynamic> json) =>
      _$PubKeyCredParamFromJson(json);
}

@freezed
class AuthenticatorSelection with _$AuthenticatorSelection {
  const factory AuthenticatorSelection({
    String? authenticatorAttachment,
    String? residentKey,
    String? userVerification,
  }) = _AuthenticatorSelection;

  factory AuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorSelectionFromJson(json);
}
