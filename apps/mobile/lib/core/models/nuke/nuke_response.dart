import 'package:freezed_annotation/freezed_annotation.dart';

part 'nuke_response.freezed.dart';
part 'nuke_response.g.dart';

@freezed
class NukeInitiatedResponse with _$NukeInitiatedResponse {
  const factory NukeInitiatedResponse({
    required String nukeToken,
    required DateTime expiresAt,
    required int countdown,
  }) = _NukeInitiatedResponse;

  factory NukeInitiatedResponse.fromJson(Map<String, dynamic> json) =>
      _$NukeInitiatedResponseFromJson(json);
}

@freezed
class NukeRequest with _$NukeRequest {
  const factory NukeRequest({
    @Default('standard') String mode,
    String? nukeToken,
    String? deviceKeySignature,
  }) = _NukeRequest;

  factory NukeRequest.fromJson(Map<String, dynamic> json) =>
      _$NukeRequestFromJson(json);
}

@freezed
class DeleteAccountRequest with _$DeleteAccountRequest {
  const factory DeleteAccountRequest({
    String? password,
    required String confirmation,
  }) = _DeleteAccountRequest;

  factory DeleteAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountRequestFromJson(json);
}
