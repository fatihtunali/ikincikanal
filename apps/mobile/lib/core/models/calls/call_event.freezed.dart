// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PendingCallEvent _$PendingCallEventFromJson(Map<String, dynamic> json) {
  return _PendingCallEvent.fromJson(json);
}

/// @nodoc
mixin _$PendingCallEvent {
  String get eventId => throw _privateConstructorUsedError;
  String get callId => throw _privateConstructorUsedError;
  String get fromUserId => throw _privateConstructorUsedError;
  String get fromDeviceId => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  String get encryptedPayload => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this PendingCallEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingCallEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingCallEventCopyWith<PendingCallEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingCallEventCopyWith<$Res> {
  factory $PendingCallEventCopyWith(
    PendingCallEvent value,
    $Res Function(PendingCallEvent) then,
  ) = _$PendingCallEventCopyWithImpl<$Res, PendingCallEvent>;
  @useResult
  $Res call({
    String eventId,
    String callId,
    String fromUserId,
    String fromDeviceId,
    String eventType,
    String encryptedPayload,
    DateTime receivedAt,
    DateTime expiresAt,
  });
}

/// @nodoc
class _$PendingCallEventCopyWithImpl<$Res, $Val extends PendingCallEvent>
    implements $PendingCallEventCopyWith<$Res> {
  _$PendingCallEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingCallEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? callId = null,
    Object? fromUserId = null,
    Object? fromDeviceId = null,
    Object? eventType = null,
    Object? encryptedPayload = null,
    Object? receivedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _value.copyWith(
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            fromUserId: null == fromUserId
                ? _value.fromUserId
                : fromUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            fromDeviceId: null == fromDeviceId
                ? _value.fromDeviceId
                : fromDeviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String,
            encryptedPayload: null == encryptedPayload
                ? _value.encryptedPayload
                : encryptedPayload // ignore: cast_nullable_to_non_nullable
                      as String,
            receivedAt: null == receivedAt
                ? _value.receivedAt
                : receivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingCallEventImplCopyWith<$Res>
    implements $PendingCallEventCopyWith<$Res> {
  factory _$$PendingCallEventImplCopyWith(
    _$PendingCallEventImpl value,
    $Res Function(_$PendingCallEventImpl) then,
  ) = __$$PendingCallEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eventId,
    String callId,
    String fromUserId,
    String fromDeviceId,
    String eventType,
    String encryptedPayload,
    DateTime receivedAt,
    DateTime expiresAt,
  });
}

/// @nodoc
class __$$PendingCallEventImplCopyWithImpl<$Res>
    extends _$PendingCallEventCopyWithImpl<$Res, _$PendingCallEventImpl>
    implements _$$PendingCallEventImplCopyWith<$Res> {
  __$$PendingCallEventImplCopyWithImpl(
    _$PendingCallEventImpl _value,
    $Res Function(_$PendingCallEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingCallEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? callId = null,
    Object? fromUserId = null,
    Object? fromDeviceId = null,
    Object? eventType = null,
    Object? encryptedPayload = null,
    Object? receivedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _$PendingCallEventImpl(
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        fromUserId: null == fromUserId
            ? _value.fromUserId
            : fromUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        fromDeviceId: null == fromDeviceId
            ? _value.fromDeviceId
            : fromDeviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        encryptedPayload: null == encryptedPayload
            ? _value.encryptedPayload
            : encryptedPayload // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: null == receivedAt
            ? _value.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingCallEventImpl implements _PendingCallEvent {
  const _$PendingCallEventImpl({
    required this.eventId,
    required this.callId,
    required this.fromUserId,
    required this.fromDeviceId,
    required this.eventType,
    required this.encryptedPayload,
    required this.receivedAt,
    required this.expiresAt,
  });

  factory _$PendingCallEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingCallEventImplFromJson(json);

  @override
  final String eventId;
  @override
  final String callId;
  @override
  final String fromUserId;
  @override
  final String fromDeviceId;
  @override
  final String eventType;
  @override
  final String encryptedPayload;
  @override
  final DateTime receivedAt;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'PendingCallEvent(eventId: $eventId, callId: $callId, fromUserId: $fromUserId, fromDeviceId: $fromDeviceId, eventType: $eventType, encryptedPayload: $encryptedPayload, receivedAt: $receivedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingCallEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.fromDeviceId, fromDeviceId) ||
                other.fromDeviceId == fromDeviceId) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.encryptedPayload, encryptedPayload) ||
                other.encryptedPayload == encryptedPayload) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventId,
    callId,
    fromUserId,
    fromDeviceId,
    eventType,
    encryptedPayload,
    receivedAt,
    expiresAt,
  );

  /// Create a copy of PendingCallEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingCallEventImplCopyWith<_$PendingCallEventImpl> get copyWith =>
      __$$PendingCallEventImplCopyWithImpl<_$PendingCallEventImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingCallEventImplToJson(this);
  }
}

abstract class _PendingCallEvent implements PendingCallEvent {
  const factory _PendingCallEvent({
    required final String eventId,
    required final String callId,
    required final String fromUserId,
    required final String fromDeviceId,
    required final String eventType,
    required final String encryptedPayload,
    required final DateTime receivedAt,
    required final DateTime expiresAt,
  }) = _$PendingCallEventImpl;

  factory _PendingCallEvent.fromJson(Map<String, dynamic> json) =
      _$PendingCallEventImpl.fromJson;

  @override
  String get eventId;
  @override
  String get callId;
  @override
  String get fromUserId;
  @override
  String get fromDeviceId;
  @override
  String get eventType;
  @override
  String get encryptedPayload;
  @override
  DateTime get receivedAt;
  @override
  DateTime get expiresAt;

  /// Create a copy of PendingCallEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingCallEventImplCopyWith<_$PendingCallEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PendingCallEventsResponse _$PendingCallEventsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PendingCallEventsResponse.fromJson(json);
}

/// @nodoc
mixin _$PendingCallEventsResponse {
  List<PendingCallEvent> get events => throw _privateConstructorUsedError;
  DateTime get serverTime => throw _privateConstructorUsedError;

  /// Serializes this PendingCallEventsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingCallEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingCallEventsResponseCopyWith<PendingCallEventsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingCallEventsResponseCopyWith<$Res> {
  factory $PendingCallEventsResponseCopyWith(
    PendingCallEventsResponse value,
    $Res Function(PendingCallEventsResponse) then,
  ) = _$PendingCallEventsResponseCopyWithImpl<$Res, PendingCallEventsResponse>;
  @useResult
  $Res call({List<PendingCallEvent> events, DateTime serverTime});
}

/// @nodoc
class _$PendingCallEventsResponseCopyWithImpl<
  $Res,
  $Val extends PendingCallEventsResponse
>
    implements $PendingCallEventsResponseCopyWith<$Res> {
  _$PendingCallEventsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingCallEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null, Object? serverTime = null}) {
    return _then(
      _value.copyWith(
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as List<PendingCallEvent>,
            serverTime: null == serverTime
                ? _value.serverTime
                : serverTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingCallEventsResponseImplCopyWith<$Res>
    implements $PendingCallEventsResponseCopyWith<$Res> {
  factory _$$PendingCallEventsResponseImplCopyWith(
    _$PendingCallEventsResponseImpl value,
    $Res Function(_$PendingCallEventsResponseImpl) then,
  ) = __$$PendingCallEventsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PendingCallEvent> events, DateTime serverTime});
}

/// @nodoc
class __$$PendingCallEventsResponseImplCopyWithImpl<$Res>
    extends
        _$PendingCallEventsResponseCopyWithImpl<
          $Res,
          _$PendingCallEventsResponseImpl
        >
    implements _$$PendingCallEventsResponseImplCopyWith<$Res> {
  __$$PendingCallEventsResponseImplCopyWithImpl(
    _$PendingCallEventsResponseImpl _value,
    $Res Function(_$PendingCallEventsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingCallEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null, Object? serverTime = null}) {
    return _then(
      _$PendingCallEventsResponseImpl(
        events: null == events
            ? _value._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<PendingCallEvent>,
        serverTime: null == serverTime
            ? _value.serverTime
            : serverTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingCallEventsResponseImpl implements _PendingCallEventsResponse {
  const _$PendingCallEventsResponseImpl({
    required final List<PendingCallEvent> events,
    required this.serverTime,
  }) : _events = events;

  factory _$PendingCallEventsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingCallEventsResponseImplFromJson(json);

  final List<PendingCallEvent> _events;
  @override
  List<PendingCallEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime serverTime;

  @override
  String toString() {
    return 'PendingCallEventsResponse(events: $events, serverTime: $serverTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingCallEventsResponseImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_events),
    serverTime,
  );

  /// Create a copy of PendingCallEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingCallEventsResponseImplCopyWith<_$PendingCallEventsResponseImpl>
  get copyWith =>
      __$$PendingCallEventsResponseImplCopyWithImpl<
        _$PendingCallEventsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingCallEventsResponseImplToJson(this);
  }
}

abstract class _PendingCallEventsResponse implements PendingCallEventsResponse {
  const factory _PendingCallEventsResponse({
    required final List<PendingCallEvent> events,
    required final DateTime serverTime,
  }) = _$PendingCallEventsResponseImpl;

  factory _PendingCallEventsResponse.fromJson(Map<String, dynamic> json) =
      _$PendingCallEventsResponseImpl.fromJson;

  @override
  List<PendingCallEvent> get events;
  @override
  DateTime get serverTime;

  /// Create a copy of PendingCallEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingCallEventsResponseImplCopyWith<_$PendingCallEventsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
