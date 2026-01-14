import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_message.freezed.dart';
part 'pending_message.g.dart';

@freezed
class PendingMessage with _$PendingMessage {
  const factory PendingMessage({
    required String serverMessageId,
    String? fromUserId,
    String? fromDeviceId,
    required String clientMessageId,
    required String ciphertext,
    required String envelopeType,
    required DateTime receivedAt,
    required DateTime expiresAt,
    int? disappearingSeconds,
  }) = _PendingMessage;

  factory PendingMessage.fromJson(Map<String, dynamic> json) =>
      _$PendingMessageFromJson(json);
}

@freezed
class PendingMessagesResponse with _$PendingMessagesResponse {
  const factory PendingMessagesResponse({
    required List<PendingMessage> messages,
    required DateTime serverTime,
    required bool moreAvailable,
  }) = _PendingMessagesResponse;

  factory PendingMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingMessagesResponseFromJson(json);
}
