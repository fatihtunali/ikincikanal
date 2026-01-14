// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMessageRequestImpl _$$SendMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SendMessageRequestImpl(
  toUserId: json['toUserId'] as String,
  toDeviceId: json['toDeviceId'] as String?,
  clientMessageId: json['clientMessageId'] as String,
  ciphertext: json['ciphertext'] as String,
  envelopeType: json['envelopeType'] as String,
  sentAt: DateTime.parse(json['sentAt'] as String),
  disappearingSeconds: (json['disappearingSeconds'] as num?)?.toInt(),
  urgent: json['urgent'] as bool? ?? false,
);

Map<String, dynamic> _$$SendMessageRequestImplToJson(
  _$SendMessageRequestImpl instance,
) => <String, dynamic>{
  'toUserId': instance.toUserId,
  'toDeviceId': instance.toDeviceId,
  'clientMessageId': instance.clientMessageId,
  'ciphertext': instance.ciphertext,
  'envelopeType': instance.envelopeType,
  'sentAt': instance.sentAt.toIso8601String(),
  'disappearingSeconds': instance.disappearingSeconds,
  'urgent': instance.urgent,
};

_$SealedMessageRequestImpl _$$SealedMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SealedMessageRequestImpl(
  deliveryToken: json['deliveryToken'] as String,
  toUserId: json['toUserId'] as String,
  toDeviceId: json['toDeviceId'] as String?,
  clientMessageId: json['clientMessageId'] as String,
  sealedCiphertext: json['sealedCiphertext'] as String,
  sentAt: DateTime.parse(json['sentAt'] as String),
);

Map<String, dynamic> _$$SealedMessageRequestImplToJson(
  _$SealedMessageRequestImpl instance,
) => <String, dynamic>{
  'deliveryToken': instance.deliveryToken,
  'toUserId': instance.toUserId,
  'toDeviceId': instance.toDeviceId,
  'clientMessageId': instance.clientMessageId,
  'sealedCiphertext': instance.sealedCiphertext,
  'sentAt': instance.sentAt.toIso8601String(),
};

_$SendMessageResponseImpl _$$SendMessageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SendMessageResponseImpl(
  serverMessageId: json['serverMessageId'] as String,
  receivedAt: DateTime.parse(json['receivedAt'] as String),
  queued: json['queued'] as bool,
);

Map<String, dynamic> _$$SendMessageResponseImplToJson(
  _$SendMessageResponseImpl instance,
) => <String, dynamic>{
  'serverMessageId': instance.serverMessageId,
  'receivedAt': instance.receivedAt.toIso8601String(),
  'queued': instance.queued,
};

_$AckMessagesRequestImpl _$$AckMessagesRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AckMessagesRequestImpl(
  serverMessageIds: (json['serverMessageIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  ackMode: json['ackMode'] as String? ?? 'immediate',
);

Map<String, dynamic> _$$AckMessagesRequestImplToJson(
  _$AckMessagesRequestImpl instance,
) => <String, dynamic>{
  'serverMessageIds': instance.serverMessageIds,
  'ackMode': instance.ackMode,
};
