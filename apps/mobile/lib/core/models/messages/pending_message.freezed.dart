// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PendingMessage _$PendingMessageFromJson(Map<String, dynamic> json) {
  return _PendingMessage.fromJson(json);
}

/// @nodoc
mixin _$PendingMessage {
  String get serverMessageId => throw _privateConstructorUsedError;
  String? get fromUserId => throw _privateConstructorUsedError;
  String? get fromDeviceId => throw _privateConstructorUsedError;
  String get clientMessageId => throw _privateConstructorUsedError;
  String get ciphertext => throw _privateConstructorUsedError;
  String get envelopeType => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  int? get disappearingSeconds => throw _privateConstructorUsedError;

  /// Serializes this PendingMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingMessageCopyWith<PendingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingMessageCopyWith<$Res> {
  factory $PendingMessageCopyWith(
    PendingMessage value,
    $Res Function(PendingMessage) then,
  ) = _$PendingMessageCopyWithImpl<$Res, PendingMessage>;
  @useResult
  $Res call({
    String serverMessageId,
    String? fromUserId,
    String? fromDeviceId,
    String clientMessageId,
    String ciphertext,
    String envelopeType,
    DateTime receivedAt,
    DateTime expiresAt,
    int? disappearingSeconds,
  });
}

/// @nodoc
class _$PendingMessageCopyWithImpl<$Res, $Val extends PendingMessage>
    implements $PendingMessageCopyWith<$Res> {
  _$PendingMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverMessageId = null,
    Object? fromUserId = freezed,
    Object? fromDeviceId = freezed,
    Object? clientMessageId = null,
    Object? ciphertext = null,
    Object? envelopeType = null,
    Object? receivedAt = null,
    Object? expiresAt = null,
    Object? disappearingSeconds = freezed,
  }) {
    return _then(
      _value.copyWith(
            serverMessageId: null == serverMessageId
                ? _value.serverMessageId
                : serverMessageId // ignore: cast_nullable_to_non_nullable
                      as String,
            fromUserId: freezed == fromUserId
                ? _value.fromUserId
                : fromUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromDeviceId: freezed == fromDeviceId
                ? _value.fromDeviceId
                : fromDeviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clientMessageId: null == clientMessageId
                ? _value.clientMessageId
                : clientMessageId // ignore: cast_nullable_to_non_nullable
                      as String,
            ciphertext: null == ciphertext
                ? _value.ciphertext
                : ciphertext // ignore: cast_nullable_to_non_nullable
                      as String,
            envelopeType: null == envelopeType
                ? _value.envelopeType
                : envelopeType // ignore: cast_nullable_to_non_nullable
                      as String,
            receivedAt: null == receivedAt
                ? _value.receivedAt
                : receivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            disappearingSeconds: freezed == disappearingSeconds
                ? _value.disappearingSeconds
                : disappearingSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingMessageImplCopyWith<$Res>
    implements $PendingMessageCopyWith<$Res> {
  factory _$$PendingMessageImplCopyWith(
    _$PendingMessageImpl value,
    $Res Function(_$PendingMessageImpl) then,
  ) = __$$PendingMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String serverMessageId,
    String? fromUserId,
    String? fromDeviceId,
    String clientMessageId,
    String ciphertext,
    String envelopeType,
    DateTime receivedAt,
    DateTime expiresAt,
    int? disappearingSeconds,
  });
}

/// @nodoc
class __$$PendingMessageImplCopyWithImpl<$Res>
    extends _$PendingMessageCopyWithImpl<$Res, _$PendingMessageImpl>
    implements _$$PendingMessageImplCopyWith<$Res> {
  __$$PendingMessageImplCopyWithImpl(
    _$PendingMessageImpl _value,
    $Res Function(_$PendingMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverMessageId = null,
    Object? fromUserId = freezed,
    Object? fromDeviceId = freezed,
    Object? clientMessageId = null,
    Object? ciphertext = null,
    Object? envelopeType = null,
    Object? receivedAt = null,
    Object? expiresAt = null,
    Object? disappearingSeconds = freezed,
  }) {
    return _then(
      _$PendingMessageImpl(
        serverMessageId: null == serverMessageId
            ? _value.serverMessageId
            : serverMessageId // ignore: cast_nullable_to_non_nullable
                  as String,
        fromUserId: freezed == fromUserId
            ? _value.fromUserId
            : fromUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromDeviceId: freezed == fromDeviceId
            ? _value.fromDeviceId
            : fromDeviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clientMessageId: null == clientMessageId
            ? _value.clientMessageId
            : clientMessageId // ignore: cast_nullable_to_non_nullable
                  as String,
        ciphertext: null == ciphertext
            ? _value.ciphertext
            : ciphertext // ignore: cast_nullable_to_non_nullable
                  as String,
        envelopeType: null == envelopeType
            ? _value.envelopeType
            : envelopeType // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: null == receivedAt
            ? _value.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        disappearingSeconds: freezed == disappearingSeconds
            ? _value.disappearingSeconds
            : disappearingSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingMessageImpl implements _PendingMessage {
  const _$PendingMessageImpl({
    required this.serverMessageId,
    this.fromUserId,
    this.fromDeviceId,
    required this.clientMessageId,
    required this.ciphertext,
    required this.envelopeType,
    required this.receivedAt,
    required this.expiresAt,
    this.disappearingSeconds,
  });

  factory _$PendingMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingMessageImplFromJson(json);

  @override
  final String serverMessageId;
  @override
  final String? fromUserId;
  @override
  final String? fromDeviceId;
  @override
  final String clientMessageId;
  @override
  final String ciphertext;
  @override
  final String envelopeType;
  @override
  final DateTime receivedAt;
  @override
  final DateTime expiresAt;
  @override
  final int? disappearingSeconds;

  @override
  String toString() {
    return 'PendingMessage(serverMessageId: $serverMessageId, fromUserId: $fromUserId, fromDeviceId: $fromDeviceId, clientMessageId: $clientMessageId, ciphertext: $ciphertext, envelopeType: $envelopeType, receivedAt: $receivedAt, expiresAt: $expiresAt, disappearingSeconds: $disappearingSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingMessageImpl &&
            (identical(other.serverMessageId, serverMessageId) ||
                other.serverMessageId == serverMessageId) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.fromDeviceId, fromDeviceId) ||
                other.fromDeviceId == fromDeviceId) &&
            (identical(other.clientMessageId, clientMessageId) ||
                other.clientMessageId == clientMessageId) &&
            (identical(other.ciphertext, ciphertext) ||
                other.ciphertext == ciphertext) &&
            (identical(other.envelopeType, envelopeType) ||
                other.envelopeType == envelopeType) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.disappearingSeconds, disappearingSeconds) ||
                other.disappearingSeconds == disappearingSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serverMessageId,
    fromUserId,
    fromDeviceId,
    clientMessageId,
    ciphertext,
    envelopeType,
    receivedAt,
    expiresAt,
    disappearingSeconds,
  );

  /// Create a copy of PendingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingMessageImplCopyWith<_$PendingMessageImpl> get copyWith =>
      __$$PendingMessageImplCopyWithImpl<_$PendingMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingMessageImplToJson(this);
  }
}

abstract class _PendingMessage implements PendingMessage {
  const factory _PendingMessage({
    required final String serverMessageId,
    final String? fromUserId,
    final String? fromDeviceId,
    required final String clientMessageId,
    required final String ciphertext,
    required final String envelopeType,
    required final DateTime receivedAt,
    required final DateTime expiresAt,
    final int? disappearingSeconds,
  }) = _$PendingMessageImpl;

  factory _PendingMessage.fromJson(Map<String, dynamic> json) =
      _$PendingMessageImpl.fromJson;

  @override
  String get serverMessageId;
  @override
  String? get fromUserId;
  @override
  String? get fromDeviceId;
  @override
  String get clientMessageId;
  @override
  String get ciphertext;
  @override
  String get envelopeType;
  @override
  DateTime get receivedAt;
  @override
  DateTime get expiresAt;
  @override
  int? get disappearingSeconds;

  /// Create a copy of PendingMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingMessageImplCopyWith<_$PendingMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PendingMessagesResponse _$PendingMessagesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PendingMessagesResponse.fromJson(json);
}

/// @nodoc
mixin _$PendingMessagesResponse {
  List<PendingMessage> get messages => throw _privateConstructorUsedError;
  DateTime get serverTime => throw _privateConstructorUsedError;
  bool get moreAvailable => throw _privateConstructorUsedError;

  /// Serializes this PendingMessagesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingMessagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingMessagesResponseCopyWith<PendingMessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingMessagesResponseCopyWith<$Res> {
  factory $PendingMessagesResponseCopyWith(
    PendingMessagesResponse value,
    $Res Function(PendingMessagesResponse) then,
  ) = _$PendingMessagesResponseCopyWithImpl<$Res, PendingMessagesResponse>;
  @useResult
  $Res call({
    List<PendingMessage> messages,
    DateTime serverTime,
    bool moreAvailable,
  });
}

/// @nodoc
class _$PendingMessagesResponseCopyWithImpl<
  $Res,
  $Val extends PendingMessagesResponse
>
    implements $PendingMessagesResponseCopyWith<$Res> {
  _$PendingMessagesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingMessagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? serverTime = null,
    Object? moreAvailable = null,
  }) {
    return _then(
      _value.copyWith(
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<PendingMessage>,
            serverTime: null == serverTime
                ? _value.serverTime
                : serverTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            moreAvailable: null == moreAvailable
                ? _value.moreAvailable
                : moreAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingMessagesResponseImplCopyWith<$Res>
    implements $PendingMessagesResponseCopyWith<$Res> {
  factory _$$PendingMessagesResponseImplCopyWith(
    _$PendingMessagesResponseImpl value,
    $Res Function(_$PendingMessagesResponseImpl) then,
  ) = __$$PendingMessagesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PendingMessage> messages,
    DateTime serverTime,
    bool moreAvailable,
  });
}

/// @nodoc
class __$$PendingMessagesResponseImplCopyWithImpl<$Res>
    extends
        _$PendingMessagesResponseCopyWithImpl<
          $Res,
          _$PendingMessagesResponseImpl
        >
    implements _$$PendingMessagesResponseImplCopyWith<$Res> {
  __$$PendingMessagesResponseImplCopyWithImpl(
    _$PendingMessagesResponseImpl _value,
    $Res Function(_$PendingMessagesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingMessagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? serverTime = null,
    Object? moreAvailable = null,
  }) {
    return _then(
      _$PendingMessagesResponseImpl(
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<PendingMessage>,
        serverTime: null == serverTime
            ? _value.serverTime
            : serverTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        moreAvailable: null == moreAvailable
            ? _value.moreAvailable
            : moreAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingMessagesResponseImpl implements _PendingMessagesResponse {
  const _$PendingMessagesResponseImpl({
    required final List<PendingMessage> messages,
    required this.serverTime,
    required this.moreAvailable,
  }) : _messages = messages;

  factory _$PendingMessagesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingMessagesResponseImplFromJson(json);

  final List<PendingMessage> _messages;
  @override
  List<PendingMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final DateTime serverTime;
  @override
  final bool moreAvailable;

  @override
  String toString() {
    return 'PendingMessagesResponse(messages: $messages, serverTime: $serverTime, moreAvailable: $moreAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingMessagesResponseImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.moreAvailable, moreAvailable) ||
                other.moreAvailable == moreAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_messages),
    serverTime,
    moreAvailable,
  );

  /// Create a copy of PendingMessagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingMessagesResponseImplCopyWith<_$PendingMessagesResponseImpl>
  get copyWith =>
      __$$PendingMessagesResponseImplCopyWithImpl<
        _$PendingMessagesResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingMessagesResponseImplToJson(this);
  }
}

abstract class _PendingMessagesResponse implements PendingMessagesResponse {
  const factory _PendingMessagesResponse({
    required final List<PendingMessage> messages,
    required final DateTime serverTime,
    required final bool moreAvailable,
  }) = _$PendingMessagesResponseImpl;

  factory _PendingMessagesResponse.fromJson(Map<String, dynamic> json) =
      _$PendingMessagesResponseImpl.fromJson;

  @override
  List<PendingMessage> get messages;
  @override
  DateTime get serverTime;
  @override
  bool get moreAvailable;

  /// Create a copy of PendingMessagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingMessagesResponseImplCopyWith<_$PendingMessagesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
