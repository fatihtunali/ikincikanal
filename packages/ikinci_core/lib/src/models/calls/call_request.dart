import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_request.freezed.dart';
part 'call_request.g.dart';

@freezed
class CallInviteRequest with _$CallInviteRequest {
  const factory CallInviteRequest({
    required String toUserId,
    String? toDeviceId,
    required String callId,
    required String type,
    required String encryptedOffer,
    required DateTime createdAt,
  }) = _CallInviteRequest;

  factory CallInviteRequest.fromJson(Map<String, dynamic> json) =>
      _$CallInviteRequestFromJson(json);
}

@freezed
class CallInviteResponse with _$CallInviteResponse {
  const factory CallInviteResponse({
    required String callId,
    required bool accepted,
    required DateTime receivedAt,
  }) = _CallInviteResponse;

  factory CallInviteResponse.fromJson(Map<String, dynamic> json) =>
      _$CallInviteResponseFromJson(json);
}

@freezed
class CallSignalRequest with _$CallSignalRequest {
  const factory CallSignalRequest({
    required String callId,
    required String toUserId,
    String? toDeviceId,
    required String signalType,
    required String encryptedPayload,
  }) = _CallSignalRequest;

  factory CallSignalRequest.fromJson(Map<String, dynamic> json) =>
      _$CallSignalRequestFromJson(json);
}

@freezed
class AckCallEventsRequest with _$AckCallEventsRequest {
  const factory AckCallEventsRequest({
    required List<String> eventIds,
  }) = _AckCallEventsRequest;

  factory AckCallEventsRequest.fromJson(Map<String, dynamic> json) =>
      _$AckCallEventsRequestFromJson(json);
}
