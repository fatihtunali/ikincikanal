import 'package:freezed_annotation/freezed_annotation.dart';

part 'passkey_attestation.freezed.dart';
part 'passkey_attestation.g.dart';

@freezed
class PasskeyAttestation with _$PasskeyAttestation {
  const factory PasskeyAttestation({
    required String id,
    required String rawId,
    required String type,
    required PasskeyAttestationResponse response,
    String? authenticatorAttachment,
  }) = _PasskeyAttestation;

  factory PasskeyAttestation.fromJson(Map<String, dynamic> json) =>
      _$PasskeyAttestationFromJson(json);
}

@freezed
class PasskeyAttestationResponse with _$PasskeyAttestationResponse {
  const factory PasskeyAttestationResponse({
    required String clientDataJSON,
    required String attestationObject,
    List<String>? transports,
  }) = _PasskeyAttestationResponse;

  factory PasskeyAttestationResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeyAttestationResponseFromJson(json);
}

@freezed
class PasskeyAssertion with _$PasskeyAssertion {
  const factory PasskeyAssertion({
    required String id,
    required String rawId,
    required String type,
    required PasskeyAssertionResponse response,
    String? authenticatorAttachment,
  }) = _PasskeyAssertion;

  factory PasskeyAssertion.fromJson(Map<String, dynamic> json) =>
      _$PasskeyAssertionFromJson(json);
}

@freezed
class PasskeyAssertionResponse with _$PasskeyAssertionResponse {
  const factory PasskeyAssertionResponse({
    required String clientDataJSON,
    required String authenticatorData,
    required String signature,
    String? userHandle,
  }) = _PasskeyAssertionResponse;

  factory PasskeyAssertionResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeyAssertionResponseFromJson(json);
}
