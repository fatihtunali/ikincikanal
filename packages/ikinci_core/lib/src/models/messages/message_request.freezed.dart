// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) {
  return _SendMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$SendMessageRequest {
  String get toUserId => throw _privateConstructorUsedError;
  String? get toDeviceId => throw _privateConstructorUsedError;
  String get clientMessageId => throw _privateConstructorUsedError;
  String get ciphertext => throw _privateConstructorUsedError;
  String get envelopeType => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  int? get disappearingSeconds => throw _privateConstructorUsedError;
  bool get urgent => throw _privateConstructorUsedError;

  /// Serializes this SendMessageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendMessageRequestCopyWith<SendMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageRequestCopyWith<$Res> {
  factory $SendMessageRequestCopyWith(
    SendMessageRequest value,
    $Res Function(SendMessageRequest) then,
  ) = _$SendMessageRequestCopyWithImpl<$Res, SendMessageRequest>;
  @useResult
  $Res call({
    String toUserId,
    String? toDeviceId,
    String clientMessageId,
    String ciphertext,
    String envelopeType,
    DateTime sentAt,
    int? disappearingSeconds,
    bool urgent,
  });
}

/// @nodoc
class _$SendMessageRequestCopyWithImpl<$Res, $Val extends SendMessageRequest>
    implements $SendMessageRequestCopyWith<$Res> {
  _$SendMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? clientMessageId = null,
    Object? ciphertext = null,
    Object? envelopeType = null,
    Object? sentAt = null,
    Object? disappearingSeconds = freezed,
    Object? urgent = null,
  }) {
    return _then(
      _value.copyWith(
            toUserId: null == toUserId
                ? _value.toUserId
                : toUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            toDeviceId: freezed == toDeviceId
                ? _value.toDeviceId
                : toDeviceId // ignore: cast_nullable_to_non_nullable
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
            sentAt: null == sentAt
                ? _value.sentAt
                : sentAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            disappearingSeconds: freezed == disappearingSeconds
                ? _value.disappearingSeconds
                : disappearingSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            urgent: null == urgent
                ? _value.urgent
                : urgent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendMessageRequestImplCopyWith<$Res>
    implements $SendMessageRequestCopyWith<$Res> {
  factory _$$SendMessageRequestImplCopyWith(
    _$SendMessageRequestImpl value,
    $Res Function(_$SendMessageRequestImpl) then,
  ) = __$$SendMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String toUserId,
    String? toDeviceId,
    String clientMessageId,
    String ciphertext,
    String envelopeType,
    DateTime sentAt,
    int? disappearingSeconds,
    bool urgent,
  });
}

/// @nodoc
class __$$SendMessageRequestImplCopyWithImpl<$Res>
    extends _$SendMessageRequestCopyWithImpl<$Res, _$SendMessageRequestImpl>
    implements _$$SendMessageRequestImplCopyWith<$Res> {
  __$$SendMessageRequestImplCopyWithImpl(
    _$SendMessageRequestImpl _value,
    $Res Function(_$SendMessageRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? clientMessageId = null,
    Object? ciphertext = null,
    Object? envelopeType = null,
    Object? sentAt = null,
    Object? disappearingSeconds = freezed,
    Object? urgent = null,
  }) {
    return _then(
      _$SendMessageRequestImpl(
        toUserId: null == toUserId
            ? _value.toUserId
            : toUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        toDeviceId: freezed == toDeviceId
            ? _value.toDeviceId
            : toDeviceId // ignore: cast_nullable_to_non_nullable
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
        sentAt: null == sentAt
            ? _value.sentAt
            : sentAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        disappearingSeconds: freezed == disappearingSeconds
            ? _value.disappearingSeconds
            : disappearingSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        urgent: null == urgent
            ? _value.urgent
            : urgent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMessageRequestImpl implements _SendMessageRequest {
  const _$SendMessageRequestImpl({
    required this.toUserId,
    this.toDeviceId,
    required this.clientMessageId,
    required this.ciphertext,
    required this.envelopeType,
    required this.sentAt,
    this.disappearingSeconds,
    this.urgent = false,
  });

  factory _$SendMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMessageRequestImplFromJson(json);

  @override
  final String toUserId;
  @override
  final String? toDeviceId;
  @override
  final String clientMessageId;
  @override
  final String ciphertext;
  @override
  final String envelopeType;
  @override
  final DateTime sentAt;
  @override
  final int? disappearingSeconds;
  @override
  @JsonKey()
  final bool urgent;

  @override
  String toString() {
    return 'SendMessageRequest(toUserId: $toUserId, toDeviceId: $toDeviceId, clientMessageId: $clientMessageId, ciphertext: $ciphertext, envelopeType: $envelopeType, sentAt: $sentAt, disappearingSeconds: $disappearingSeconds, urgent: $urgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageRequestImpl &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.toDeviceId, toDeviceId) ||
                other.toDeviceId == toDeviceId) &&
            (identical(other.clientMessageId, clientMessageId) ||
                other.clientMessageId == clientMessageId) &&
            (identical(other.ciphertext, ciphertext) ||
                other.ciphertext == ciphertext) &&
            (identical(other.envelopeType, envelopeType) ||
                other.envelopeType == envelopeType) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.disappearingSeconds, disappearingSeconds) ||
                other.disappearingSeconds == disappearingSeconds) &&
            (identical(other.urgent, urgent) || other.urgent == urgent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    toUserId,
    toDeviceId,
    clientMessageId,
    ciphertext,
    envelopeType,
    sentAt,
    disappearingSeconds,
    urgent,
  );

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      __$$SendMessageRequestImplCopyWithImpl<_$SendMessageRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMessageRequestImplToJson(this);
  }
}

abstract class _SendMessageRequest implements SendMessageRequest {
  const factory _SendMessageRequest({
    required final String toUserId,
    final String? toDeviceId,
    required final String clientMessageId,
    required final String ciphertext,
    required final String envelopeType,
    required final DateTime sentAt,
    final int? disappearingSeconds,
    final bool urgent,
  }) = _$SendMessageRequestImpl;

  factory _SendMessageRequest.fromJson(Map<String, dynamic> json) =
      _$SendMessageRequestImpl.fromJson;

  @override
  String get toUserId;
  @override
  String? get toDeviceId;
  @override
  String get clientMessageId;
  @override
  String get ciphertext;
  @override
  String get envelopeType;
  @override
  DateTime get sentAt;
  @override
  int? get disappearingSeconds;
  @override
  bool get urgent;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SealedMessageRequest _$SealedMessageRequestFromJson(Map<String, dynamic> json) {
  return _SealedMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$SealedMessageRequest {
  String get deliveryToken => throw _privateConstructorUsedError;
  String get toUserId => throw _privateConstructorUsedError;
  String? get toDeviceId => throw _privateConstructorUsedError;
  String get clientMessageId => throw _privateConstructorUsedError;
  String get sealedCiphertext => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;

  /// Serializes this SealedMessageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SealedMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SealedMessageRequestCopyWith<SealedMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SealedMessageRequestCopyWith<$Res> {
  factory $SealedMessageRequestCopyWith(
    SealedMessageRequest value,
    $Res Function(SealedMessageRequest) then,
  ) = _$SealedMessageRequestCopyWithImpl<$Res, SealedMessageRequest>;
  @useResult
  $Res call({
    String deliveryToken,
    String toUserId,
    String? toDeviceId,
    String clientMessageId,
    String sealedCiphertext,
    DateTime sentAt,
  });
}

/// @nodoc
class _$SealedMessageRequestCopyWithImpl<
  $Res,
  $Val extends SealedMessageRequest
>
    implements $SealedMessageRequestCopyWith<$Res> {
  _$SealedMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SealedMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryToken = null,
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? clientMessageId = null,
    Object? sealedCiphertext = null,
    Object? sentAt = null,
  }) {
    return _then(
      _value.copyWith(
            deliveryToken: null == deliveryToken
                ? _value.deliveryToken
                : deliveryToken // ignore: cast_nullable_to_non_nullable
                      as String,
            toUserId: null == toUserId
                ? _value.toUserId
                : toUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            toDeviceId: freezed == toDeviceId
                ? _value.toDeviceId
                : toDeviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clientMessageId: null == clientMessageId
                ? _value.clientMessageId
                : clientMessageId // ignore: cast_nullable_to_non_nullable
                      as String,
            sealedCiphertext: null == sealedCiphertext
                ? _value.sealedCiphertext
                : sealedCiphertext // ignore: cast_nullable_to_non_nullable
                      as String,
            sentAt: null == sentAt
                ? _value.sentAt
                : sentAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SealedMessageRequestImplCopyWith<$Res>
    implements $SealedMessageRequestCopyWith<$Res> {
  factory _$$SealedMessageRequestImplCopyWith(
    _$SealedMessageRequestImpl value,
    $Res Function(_$SealedMessageRequestImpl) then,
  ) = __$$SealedMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deliveryToken,
    String toUserId,
    String? toDeviceId,
    String clientMessageId,
    String sealedCiphertext,
    DateTime sentAt,
  });
}

/// @nodoc
class __$$SealedMessageRequestImplCopyWithImpl<$Res>
    extends _$SealedMessageRequestCopyWithImpl<$Res, _$SealedMessageRequestImpl>
    implements _$$SealedMessageRequestImplCopyWith<$Res> {
  __$$SealedMessageRequestImplCopyWithImpl(
    _$SealedMessageRequestImpl _value,
    $Res Function(_$SealedMessageRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SealedMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryToken = null,
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? clientMessageId = null,
    Object? sealedCiphertext = null,
    Object? sentAt = null,
  }) {
    return _then(
      _$SealedMessageRequestImpl(
        deliveryToken: null == deliveryToken
            ? _value.deliveryToken
            : deliveryToken // ignore: cast_nullable_to_non_nullable
                  as String,
        toUserId: null == toUserId
            ? _value.toUserId
            : toUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        toDeviceId: freezed == toDeviceId
            ? _value.toDeviceId
            : toDeviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clientMessageId: null == clientMessageId
            ? _value.clientMessageId
            : clientMessageId // ignore: cast_nullable_to_non_nullable
                  as String,
        sealedCiphertext: null == sealedCiphertext
            ? _value.sealedCiphertext
            : sealedCiphertext // ignore: cast_nullable_to_non_nullable
                  as String,
        sentAt: null == sentAt
            ? _value.sentAt
            : sentAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SealedMessageRequestImpl implements _SealedMessageRequest {
  const _$SealedMessageRequestImpl({
    required this.deliveryToken,
    required this.toUserId,
    this.toDeviceId,
    required this.clientMessageId,
    required this.sealedCiphertext,
    required this.sentAt,
  });

  factory _$SealedMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SealedMessageRequestImplFromJson(json);

  @override
  final String deliveryToken;
  @override
  final String toUserId;
  @override
  final String? toDeviceId;
  @override
  final String clientMessageId;
  @override
  final String sealedCiphertext;
  @override
  final DateTime sentAt;

  @override
  String toString() {
    return 'SealedMessageRequest(deliveryToken: $deliveryToken, toUserId: $toUserId, toDeviceId: $toDeviceId, clientMessageId: $clientMessageId, sealedCiphertext: $sealedCiphertext, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SealedMessageRequestImpl &&
            (identical(other.deliveryToken, deliveryToken) ||
                other.deliveryToken == deliveryToken) &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.toDeviceId, toDeviceId) ||
                other.toDeviceId == toDeviceId) &&
            (identical(other.clientMessageId, clientMessageId) ||
                other.clientMessageId == clientMessageId) &&
            (identical(other.sealedCiphertext, sealedCiphertext) ||
                other.sealedCiphertext == sealedCiphertext) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deliveryToken,
    toUserId,
    toDeviceId,
    clientMessageId,
    sealedCiphertext,
    sentAt,
  );

  /// Create a copy of SealedMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SealedMessageRequestImplCopyWith<_$SealedMessageRequestImpl>
  get copyWith =>
      __$$SealedMessageRequestImplCopyWithImpl<_$SealedMessageRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SealedMessageRequestImplToJson(this);
  }
}

abstract class _SealedMessageRequest implements SealedMessageRequest {
  const factory _SealedMessageRequest({
    required final String deliveryToken,
    required final String toUserId,
    final String? toDeviceId,
    required final String clientMessageId,
    required final String sealedCiphertext,
    required final DateTime sentAt,
  }) = _$SealedMessageRequestImpl;

  factory _SealedMessageRequest.fromJson(Map<String, dynamic> json) =
      _$SealedMessageRequestImpl.fromJson;

  @override
  String get deliveryToken;
  @override
  String get toUserId;
  @override
  String? get toDeviceId;
  @override
  String get clientMessageId;
  @override
  String get sealedCiphertext;
  @override
  DateTime get sentAt;

  /// Create a copy of SealedMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SealedMessageRequestImplCopyWith<_$SealedMessageRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) {
  return _SendMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$SendMessageResponse {
  String get serverMessageId => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  bool get queued => throw _privateConstructorUsedError;

  /// Serializes this SendMessageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendMessageResponseCopyWith<SendMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageResponseCopyWith<$Res> {
  factory $SendMessageResponseCopyWith(
    SendMessageResponse value,
    $Res Function(SendMessageResponse) then,
  ) = _$SendMessageResponseCopyWithImpl<$Res, SendMessageResponse>;
  @useResult
  $Res call({String serverMessageId, DateTime receivedAt, bool queued});
}

/// @nodoc
class _$SendMessageResponseCopyWithImpl<$Res, $Val extends SendMessageResponse>
    implements $SendMessageResponseCopyWith<$Res> {
  _$SendMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverMessageId = null,
    Object? receivedAt = null,
    Object? queued = null,
  }) {
    return _then(
      _value.copyWith(
            serverMessageId: null == serverMessageId
                ? _value.serverMessageId
                : serverMessageId // ignore: cast_nullable_to_non_nullable
                      as String,
            receivedAt: null == receivedAt
                ? _value.receivedAt
                : receivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            queued: null == queued
                ? _value.queued
                : queued // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendMessageResponseImplCopyWith<$Res>
    implements $SendMessageResponseCopyWith<$Res> {
  factory _$$SendMessageResponseImplCopyWith(
    _$SendMessageResponseImpl value,
    $Res Function(_$SendMessageResponseImpl) then,
  ) = __$$SendMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serverMessageId, DateTime receivedAt, bool queued});
}

/// @nodoc
class __$$SendMessageResponseImplCopyWithImpl<$Res>
    extends _$SendMessageResponseCopyWithImpl<$Res, _$SendMessageResponseImpl>
    implements _$$SendMessageResponseImplCopyWith<$Res> {
  __$$SendMessageResponseImplCopyWithImpl(
    _$SendMessageResponseImpl _value,
    $Res Function(_$SendMessageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverMessageId = null,
    Object? receivedAt = null,
    Object? queued = null,
  }) {
    return _then(
      _$SendMessageResponseImpl(
        serverMessageId: null == serverMessageId
            ? _value.serverMessageId
            : serverMessageId // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: null == receivedAt
            ? _value.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        queued: null == queued
            ? _value.queued
            : queued // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMessageResponseImpl implements _SendMessageResponse {
  const _$SendMessageResponseImpl({
    required this.serverMessageId,
    required this.receivedAt,
    required this.queued,
  });

  factory _$SendMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMessageResponseImplFromJson(json);

  @override
  final String serverMessageId;
  @override
  final DateTime receivedAt;
  @override
  final bool queued;

  @override
  String toString() {
    return 'SendMessageResponse(serverMessageId: $serverMessageId, receivedAt: $receivedAt, queued: $queued)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageResponseImpl &&
            (identical(other.serverMessageId, serverMessageId) ||
                other.serverMessageId == serverMessageId) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.queued, queued) || other.queued == queued));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serverMessageId, receivedAt, queued);

  /// Create a copy of SendMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageResponseImplCopyWith<_$SendMessageResponseImpl> get copyWith =>
      __$$SendMessageResponseImplCopyWithImpl<_$SendMessageResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMessageResponseImplToJson(this);
  }
}

abstract class _SendMessageResponse implements SendMessageResponse {
  const factory _SendMessageResponse({
    required final String serverMessageId,
    required final DateTime receivedAt,
    required final bool queued,
  }) = _$SendMessageResponseImpl;

  factory _SendMessageResponse.fromJson(Map<String, dynamic> json) =
      _$SendMessageResponseImpl.fromJson;

  @override
  String get serverMessageId;
  @override
  DateTime get receivedAt;
  @override
  bool get queued;

  /// Create a copy of SendMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageResponseImplCopyWith<_$SendMessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AckMessagesRequest _$AckMessagesRequestFromJson(Map<String, dynamic> json) {
  return _AckMessagesRequest.fromJson(json);
}

/// @nodoc
mixin _$AckMessagesRequest {
  List<String> get serverMessageIds => throw _privateConstructorUsedError;
  String get ackMode => throw _privateConstructorUsedError;

  /// Serializes this AckMessagesRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AckMessagesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AckMessagesRequestCopyWith<AckMessagesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AckMessagesRequestCopyWith<$Res> {
  factory $AckMessagesRequestCopyWith(
    AckMessagesRequest value,
    $Res Function(AckMessagesRequest) then,
  ) = _$AckMessagesRequestCopyWithImpl<$Res, AckMessagesRequest>;
  @useResult
  $Res call({List<String> serverMessageIds, String ackMode});
}

/// @nodoc
class _$AckMessagesRequestCopyWithImpl<$Res, $Val extends AckMessagesRequest>
    implements $AckMessagesRequestCopyWith<$Res> {
  _$AckMessagesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AckMessagesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? serverMessageIds = null, Object? ackMode = null}) {
    return _then(
      _value.copyWith(
            serverMessageIds: null == serverMessageIds
                ? _value.serverMessageIds
                : serverMessageIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            ackMode: null == ackMode
                ? _value.ackMode
                : ackMode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AckMessagesRequestImplCopyWith<$Res>
    implements $AckMessagesRequestCopyWith<$Res> {
  factory _$$AckMessagesRequestImplCopyWith(
    _$AckMessagesRequestImpl value,
    $Res Function(_$AckMessagesRequestImpl) then,
  ) = __$$AckMessagesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> serverMessageIds, String ackMode});
}

/// @nodoc
class __$$AckMessagesRequestImplCopyWithImpl<$Res>
    extends _$AckMessagesRequestCopyWithImpl<$Res, _$AckMessagesRequestImpl>
    implements _$$AckMessagesRequestImplCopyWith<$Res> {
  __$$AckMessagesRequestImplCopyWithImpl(
    _$AckMessagesRequestImpl _value,
    $Res Function(_$AckMessagesRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AckMessagesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? serverMessageIds = null, Object? ackMode = null}) {
    return _then(
      _$AckMessagesRequestImpl(
        serverMessageIds: null == serverMessageIds
            ? _value._serverMessageIds
            : serverMessageIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        ackMode: null == ackMode
            ? _value.ackMode
            : ackMode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AckMessagesRequestImpl implements _AckMessagesRequest {
  const _$AckMessagesRequestImpl({
    required final List<String> serverMessageIds,
    this.ackMode = 'immediate',
  }) : _serverMessageIds = serverMessageIds;

  factory _$AckMessagesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AckMessagesRequestImplFromJson(json);

  final List<String> _serverMessageIds;
  @override
  List<String> get serverMessageIds {
    if (_serverMessageIds is EqualUnmodifiableListView)
      return _serverMessageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serverMessageIds);
  }

  @override
  @JsonKey()
  final String ackMode;

  @override
  String toString() {
    return 'AckMessagesRequest(serverMessageIds: $serverMessageIds, ackMode: $ackMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AckMessagesRequestImpl &&
            const DeepCollectionEquality().equals(
              other._serverMessageIds,
              _serverMessageIds,
            ) &&
            (identical(other.ackMode, ackMode) || other.ackMode == ackMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_serverMessageIds),
    ackMode,
  );

  /// Create a copy of AckMessagesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AckMessagesRequestImplCopyWith<_$AckMessagesRequestImpl> get copyWith =>
      __$$AckMessagesRequestImplCopyWithImpl<_$AckMessagesRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AckMessagesRequestImplToJson(this);
  }
}

abstract class _AckMessagesRequest implements AckMessagesRequest {
  const factory _AckMessagesRequest({
    required final List<String> serverMessageIds,
    final String ackMode,
  }) = _$AckMessagesRequestImpl;

  factory _AckMessagesRequest.fromJson(Map<String, dynamic> json) =
      _$AckMessagesRequestImpl.fromJson;

  @override
  List<String> get serverMessageIds;
  @override
  String get ackMode;

  /// Create a copy of AckMessagesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AckMessagesRequestImplCopyWith<_$AckMessagesRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
