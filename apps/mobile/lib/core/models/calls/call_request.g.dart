// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallInviteRequestImpl _$$CallInviteRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CallInviteRequestImpl(
  toUserId: json['toUserId'] as String,
  toDeviceId: json['toDeviceId'] as String?,
  callId: json['callId'] as String,
  type: json['type'] as String,
  encryptedOffer: json['encryptedOffer'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$CallInviteRequestImplToJson(
  _$CallInviteRequestImpl instance,
) => <String, dynamic>{
  'toUserId': instance.toUserId,
  'toDeviceId': instance.toDeviceId,
  'callId': instance.callId,
  'type': instance.type,
  'encryptedOffer': instance.encryptedOffer,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$CallInviteResponseImpl _$$CallInviteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CallInviteResponseImpl(
  callId: json['callId'] as String,
  accepted: json['accepted'] as bool,
  receivedAt: DateTime.parse(json['receivedAt'] as String),
);

Map<String, dynamic> _$$CallInviteResponseImplToJson(
  _$CallInviteResponseImpl instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'accepted': instance.accepted,
  'receivedAt': instance.receivedAt.toIso8601String(),
};

_$CallSignalRequestImpl _$$CallSignalRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CallSignalRequestImpl(
  callId: json['callId'] as String,
  toUserId: json['toUserId'] as String,
  toDeviceId: json['toDeviceId'] as String?,
  signalType: json['signalType'] as String,
  encryptedPayload: json['encryptedPayload'] as String,
);

Map<String, dynamic> _$$CallSignalRequestImplToJson(
  _$CallSignalRequestImpl instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'toUserId': instance.toUserId,
  'toDeviceId': instance.toDeviceId,
  'signalType': instance.signalType,
  'encryptedPayload': instance.encryptedPayload,
};

_$AckCallEventsRequestImpl _$$AckCallEventsRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AckCallEventsRequestImpl(
  eventIds: (json['eventIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$AckCallEventsRequestImplToJson(
  _$AckCallEventsRequestImpl instance,
) => <String, dynamic>{'eventIds': instance.eventIds};
