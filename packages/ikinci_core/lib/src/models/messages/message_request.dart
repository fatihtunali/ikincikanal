import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_request.freezed.dart';
part 'message_request.g.dart';

@freezed
class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    required String toUserId,
    String? toDeviceId,
    required String clientMessageId,
    required String ciphertext,
    required String envelopeType,
    required DateTime sentAt,
    int? disappearingSeconds,
    @Default(false) bool urgent,
  }) = _SendMessageRequest;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);
}

@freezed
class SealedMessageRequest with _$SealedMessageRequest {
  const factory SealedMessageRequest({
    required String deliveryToken,
    required String toUserId,
    String? toDeviceId,
    required String clientMessageId,
    required String sealedCiphertext,
    required DateTime sentAt,
  }) = _SealedMessageRequest;

  factory SealedMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SealedMessageRequestFromJson(json);
}

@freezed
class SendMessageResponse with _$SendMessageResponse {
  const factory SendMessageResponse({
    required String serverMessageId,
    required DateTime receivedAt,
    required bool queued,
  }) = _SendMessageResponse;

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);
}

@freezed
class AckMessagesRequest with _$AckMessagesRequest {
  const factory AckMessagesRequest({
    required List<String> serverMessageIds,
    @Default('immediate') String ackMode,
  }) = _AckMessagesRequest;

  factory AckMessagesRequest.fromJson(Map<String, dynamic> json) =>
      _$AckMessagesRequestFromJson(json);
}
