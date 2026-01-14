// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingCallEventImpl _$$PendingCallEventImplFromJson(
  Map<String, dynamic> json,
) => _$PendingCallEventImpl(
  eventId: json['eventId'] as String,
  callId: json['callId'] as String,
  fromUserId: json['fromUserId'] as String,
  fromDeviceId: json['fromDeviceId'] as String,
  eventType: json['eventType'] as String,
  encryptedPayload: json['encryptedPayload'] as String,
  receivedAt: DateTime.parse(json['receivedAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$$PendingCallEventImplToJson(
  _$PendingCallEventImpl instance,
) => <String, dynamic>{
  'eventId': instance.eventId,
  'callId': instance.callId,
  'fromUserId': instance.fromUserId,
  'fromDeviceId': instance.fromDeviceId,
  'eventType': instance.eventType,
  'encryptedPayload': instance.encryptedPayload,
  'receivedAt': instance.receivedAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
};

_$PendingCallEventsResponseImpl _$$PendingCallEventsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PendingCallEventsResponseImpl(
  events: (json['events'] as List<dynamic>)
      .map((e) => PendingCallEvent.fromJson(e as Map<String, dynamic>))
      .toList(),
  serverTime: DateTime.parse(json['serverTime'] as String),
);

Map<String, dynamic> _$$PendingCallEventsResponseImplToJson(
  _$PendingCallEventsResponseImpl instance,
) => <String, dynamic>{
  'events': instance.events,
  'serverTime': instance.serverTime.toIso8601String(),
};
