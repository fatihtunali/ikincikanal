// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingMessageImpl _$$PendingMessageImplFromJson(Map<String, dynamic> json) =>
    _$PendingMessageImpl(
      serverMessageId: json['serverMessageId'] as String,
      fromUserId: json['fromUserId'] as String?,
      fromDeviceId: json['fromDeviceId'] as String?,
      clientMessageId: json['clientMessageId'] as String,
      ciphertext: json['ciphertext'] as String,
      envelopeType: json['envelopeType'] as String,
      receivedAt: DateTime.parse(json['receivedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      disappearingSeconds: (json['disappearingSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PendingMessageImplToJson(
  _$PendingMessageImpl instance,
) => <String, dynamic>{
  'serverMessageId': instance.serverMessageId,
  'fromUserId': instance.fromUserId,
  'fromDeviceId': instance.fromDeviceId,
  'clientMessageId': instance.clientMessageId,
  'ciphertext': instance.ciphertext,
  'envelopeType': instance.envelopeType,
  'receivedAt': instance.receivedAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
  'disappearingSeconds': instance.disappearingSeconds,
};

_$PendingMessagesResponseImpl _$$PendingMessagesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PendingMessagesResponseImpl(
  messages: (json['messages'] as List<dynamic>)
      .map((e) => PendingMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
  serverTime: DateTime.parse(json['serverTime'] as String),
  moreAvailable: json['moreAvailable'] as bool,
);

Map<String, dynamic> _$$PendingMessagesResponseImplToJson(
  _$PendingMessagesResponseImpl instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'serverTime': instance.serverTime.toIso8601String(),
  'moreAvailable': instance.moreAvailable,
};
