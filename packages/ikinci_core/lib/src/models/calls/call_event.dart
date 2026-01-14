import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_event.freezed.dart';
part 'call_event.g.dart';

@freezed
class PendingCallEvent with _$PendingCallEvent {
  const factory PendingCallEvent({
    required String eventId,
    required String callId,
    required String fromUserId,
    required String fromDeviceId,
    required String eventType,
    required String encryptedPayload,
    required DateTime receivedAt,
    required DateTime expiresAt,
  }) = _PendingCallEvent;

  factory PendingCallEvent.fromJson(Map<String, dynamic> json) =>
      _$PendingCallEventFromJson(json);
}

@freezed
class PendingCallEventsResponse with _$PendingCallEventsResponse {
  const factory PendingCallEventsResponse({
    required List<PendingCallEvent> events,
    required DateTime serverTime,
  }) = _PendingCallEventsResponse;

  factory PendingCallEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingCallEventsResponseFromJson(json);
}
