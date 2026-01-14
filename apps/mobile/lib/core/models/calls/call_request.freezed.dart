// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallInviteRequest _$CallInviteRequestFromJson(Map<String, dynamic> json) {
  return _CallInviteRequest.fromJson(json);
}

/// @nodoc
mixin _$CallInviteRequest {
  String get toUserId => throw _privateConstructorUsedError;
  String? get toDeviceId => throw _privateConstructorUsedError;
  String get callId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get encryptedOffer => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CallInviteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallInviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallInviteRequestCopyWith<CallInviteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallInviteRequestCopyWith<$Res> {
  factory $CallInviteRequestCopyWith(
    CallInviteRequest value,
    $Res Function(CallInviteRequest) then,
  ) = _$CallInviteRequestCopyWithImpl<$Res, CallInviteRequest>;
  @useResult
  $Res call({
    String toUserId,
    String? toDeviceId,
    String callId,
    String type,
    String encryptedOffer,
    DateTime createdAt,
  });
}

/// @nodoc
class _$CallInviteRequestCopyWithImpl<$Res, $Val extends CallInviteRequest>
    implements $CallInviteRequestCopyWith<$Res> {
  _$CallInviteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallInviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? callId = null,
    Object? type = null,
    Object? encryptedOffer = null,
    Object? createdAt = null,
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
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            encryptedOffer: null == encryptedOffer
                ? _value.encryptedOffer
                : encryptedOffer // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallInviteRequestImplCopyWith<$Res>
    implements $CallInviteRequestCopyWith<$Res> {
  factory _$$CallInviteRequestImplCopyWith(
    _$CallInviteRequestImpl value,
    $Res Function(_$CallInviteRequestImpl) then,
  ) = __$$CallInviteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String toUserId,
    String? toDeviceId,
    String callId,
    String type,
    String encryptedOffer,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$CallInviteRequestImplCopyWithImpl<$Res>
    extends _$CallInviteRequestCopyWithImpl<$Res, _$CallInviteRequestImpl>
    implements _$$CallInviteRequestImplCopyWith<$Res> {
  __$$CallInviteRequestImplCopyWithImpl(
    _$CallInviteRequestImpl _value,
    $Res Function(_$CallInviteRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallInviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? callId = null,
    Object? type = null,
    Object? encryptedOffer = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$CallInviteRequestImpl(
        toUserId: null == toUserId
            ? _value.toUserId
            : toUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        toDeviceId: freezed == toDeviceId
            ? _value.toDeviceId
            : toDeviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        encryptedOffer: null == encryptedOffer
            ? _value.encryptedOffer
            : encryptedOffer // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallInviteRequestImpl implements _CallInviteRequest {
  const _$CallInviteRequestImpl({
    required this.toUserId,
    this.toDeviceId,
    required this.callId,
    required this.type,
    required this.encryptedOffer,
    required this.createdAt,
  });

  factory _$CallInviteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallInviteRequestImplFromJson(json);

  @override
  final String toUserId;
  @override
  final String? toDeviceId;
  @override
  final String callId;
  @override
  final String type;
  @override
  final String encryptedOffer;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CallInviteRequest(toUserId: $toUserId, toDeviceId: $toDeviceId, callId: $callId, type: $type, encryptedOffer: $encryptedOffer, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallInviteRequestImpl &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.toDeviceId, toDeviceId) ||
                other.toDeviceId == toDeviceId) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.encryptedOffer, encryptedOffer) ||
                other.encryptedOffer == encryptedOffer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    toUserId,
    toDeviceId,
    callId,
    type,
    encryptedOffer,
    createdAt,
  );

  /// Create a copy of CallInviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallInviteRequestImplCopyWith<_$CallInviteRequestImpl> get copyWith =>
      __$$CallInviteRequestImplCopyWithImpl<_$CallInviteRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallInviteRequestImplToJson(this);
  }
}

abstract class _CallInviteRequest implements CallInviteRequest {
  const factory _CallInviteRequest({
    required final String toUserId,
    final String? toDeviceId,
    required final String callId,
    required final String type,
    required final String encryptedOffer,
    required final DateTime createdAt,
  }) = _$CallInviteRequestImpl;

  factory _CallInviteRequest.fromJson(Map<String, dynamic> json) =
      _$CallInviteRequestImpl.fromJson;

  @override
  String get toUserId;
  @override
  String? get toDeviceId;
  @override
  String get callId;
  @override
  String get type;
  @override
  String get encryptedOffer;
  @override
  DateTime get createdAt;

  /// Create a copy of CallInviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallInviteRequestImplCopyWith<_$CallInviteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallInviteResponse _$CallInviteResponseFromJson(Map<String, dynamic> json) {
  return _CallInviteResponse.fromJson(json);
}

/// @nodoc
mixin _$CallInviteResponse {
  String get callId => throw _privateConstructorUsedError;
  bool get accepted => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;

  /// Serializes this CallInviteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallInviteResponseCopyWith<CallInviteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallInviteResponseCopyWith<$Res> {
  factory $CallInviteResponseCopyWith(
    CallInviteResponse value,
    $Res Function(CallInviteResponse) then,
  ) = _$CallInviteResponseCopyWithImpl<$Res, CallInviteResponse>;
  @useResult
  $Res call({String callId, bool accepted, DateTime receivedAt});
}

/// @nodoc
class _$CallInviteResponseCopyWithImpl<$Res, $Val extends CallInviteResponse>
    implements $CallInviteResponseCopyWith<$Res> {
  _$CallInviteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? accepted = null,
    Object? receivedAt = null,
  }) {
    return _then(
      _value.copyWith(
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            accepted: null == accepted
                ? _value.accepted
                : accepted // ignore: cast_nullable_to_non_nullable
                      as bool,
            receivedAt: null == receivedAt
                ? _value.receivedAt
                : receivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallInviteResponseImplCopyWith<$Res>
    implements $CallInviteResponseCopyWith<$Res> {
  factory _$$CallInviteResponseImplCopyWith(
    _$CallInviteResponseImpl value,
    $Res Function(_$CallInviteResponseImpl) then,
  ) = __$$CallInviteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String callId, bool accepted, DateTime receivedAt});
}

/// @nodoc
class __$$CallInviteResponseImplCopyWithImpl<$Res>
    extends _$CallInviteResponseCopyWithImpl<$Res, _$CallInviteResponseImpl>
    implements _$$CallInviteResponseImplCopyWith<$Res> {
  __$$CallInviteResponseImplCopyWithImpl(
    _$CallInviteResponseImpl _value,
    $Res Function(_$CallInviteResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? accepted = null,
    Object? receivedAt = null,
  }) {
    return _then(
      _$CallInviteResponseImpl(
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        accepted: null == accepted
            ? _value.accepted
            : accepted // ignore: cast_nullable_to_non_nullable
                  as bool,
        receivedAt: null == receivedAt
            ? _value.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallInviteResponseImpl implements _CallInviteResponse {
  const _$CallInviteResponseImpl({
    required this.callId,
    required this.accepted,
    required this.receivedAt,
  });

  factory _$CallInviteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallInviteResponseImplFromJson(json);

  @override
  final String callId;
  @override
  final bool accepted;
  @override
  final DateTime receivedAt;

  @override
  String toString() {
    return 'CallInviteResponse(callId: $callId, accepted: $accepted, receivedAt: $receivedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallInviteResponseImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, callId, accepted, receivedAt);

  /// Create a copy of CallInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallInviteResponseImplCopyWith<_$CallInviteResponseImpl> get copyWith =>
      __$$CallInviteResponseImplCopyWithImpl<_$CallInviteResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallInviteResponseImplToJson(this);
  }
}

abstract class _CallInviteResponse implements CallInviteResponse {
  const factory _CallInviteResponse({
    required final String callId,
    required final bool accepted,
    required final DateTime receivedAt,
  }) = _$CallInviteResponseImpl;

  factory _CallInviteResponse.fromJson(Map<String, dynamic> json) =
      _$CallInviteResponseImpl.fromJson;

  @override
  String get callId;
  @override
  bool get accepted;
  @override
  DateTime get receivedAt;

  /// Create a copy of CallInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallInviteResponseImplCopyWith<_$CallInviteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallSignalRequest _$CallSignalRequestFromJson(Map<String, dynamic> json) {
  return _CallSignalRequest.fromJson(json);
}

/// @nodoc
mixin _$CallSignalRequest {
  String get callId => throw _privateConstructorUsedError;
  String get toUserId => throw _privateConstructorUsedError;
  String? get toDeviceId => throw _privateConstructorUsedError;
  String get signalType => throw _privateConstructorUsedError;
  String get encryptedPayload => throw _privateConstructorUsedError;

  /// Serializes this CallSignalRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallSignalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallSignalRequestCopyWith<CallSignalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallSignalRequestCopyWith<$Res> {
  factory $CallSignalRequestCopyWith(
    CallSignalRequest value,
    $Res Function(CallSignalRequest) then,
  ) = _$CallSignalRequestCopyWithImpl<$Res, CallSignalRequest>;
  @useResult
  $Res call({
    String callId,
    String toUserId,
    String? toDeviceId,
    String signalType,
    String encryptedPayload,
  });
}

/// @nodoc
class _$CallSignalRequestCopyWithImpl<$Res, $Val extends CallSignalRequest>
    implements $CallSignalRequestCopyWith<$Res> {
  _$CallSignalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallSignalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? signalType = null,
    Object? encryptedPayload = null,
  }) {
    return _then(
      _value.copyWith(
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            toUserId: null == toUserId
                ? _value.toUserId
                : toUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            toDeviceId: freezed == toDeviceId
                ? _value.toDeviceId
                : toDeviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            signalType: null == signalType
                ? _value.signalType
                : signalType // ignore: cast_nullable_to_non_nullable
                      as String,
            encryptedPayload: null == encryptedPayload
                ? _value.encryptedPayload
                : encryptedPayload // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallSignalRequestImplCopyWith<$Res>
    implements $CallSignalRequestCopyWith<$Res> {
  factory _$$CallSignalRequestImplCopyWith(
    _$CallSignalRequestImpl value,
    $Res Function(_$CallSignalRequestImpl) then,
  ) = __$$CallSignalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String callId,
    String toUserId,
    String? toDeviceId,
    String signalType,
    String encryptedPayload,
  });
}

/// @nodoc
class __$$CallSignalRequestImplCopyWithImpl<$Res>
    extends _$CallSignalRequestCopyWithImpl<$Res, _$CallSignalRequestImpl>
    implements _$$CallSignalRequestImplCopyWith<$Res> {
  __$$CallSignalRequestImplCopyWithImpl(
    _$CallSignalRequestImpl _value,
    $Res Function(_$CallSignalRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallSignalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? toUserId = null,
    Object? toDeviceId = freezed,
    Object? signalType = null,
    Object? encryptedPayload = null,
  }) {
    return _then(
      _$CallSignalRequestImpl(
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        toUserId: null == toUserId
            ? _value.toUserId
            : toUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        toDeviceId: freezed == toDeviceId
            ? _value.toDeviceId
            : toDeviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        signalType: null == signalType
            ? _value.signalType
            : signalType // ignore: cast_nullable_to_non_nullable
                  as String,
        encryptedPayload: null == encryptedPayload
            ? _value.encryptedPayload
            : encryptedPayload // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallSignalRequestImpl implements _CallSignalRequest {
  const _$CallSignalRequestImpl({
    required this.callId,
    required this.toUserId,
    this.toDeviceId,
    required this.signalType,
    required this.encryptedPayload,
  });

  factory _$CallSignalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallSignalRequestImplFromJson(json);

  @override
  final String callId;
  @override
  final String toUserId;
  @override
  final String? toDeviceId;
  @override
  final String signalType;
  @override
  final String encryptedPayload;

  @override
  String toString() {
    return 'CallSignalRequest(callId: $callId, toUserId: $toUserId, toDeviceId: $toDeviceId, signalType: $signalType, encryptedPayload: $encryptedPayload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallSignalRequestImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.toDeviceId, toDeviceId) ||
                other.toDeviceId == toDeviceId) &&
            (identical(other.signalType, signalType) ||
                other.signalType == signalType) &&
            (identical(other.encryptedPayload, encryptedPayload) ||
                other.encryptedPayload == encryptedPayload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    callId,
    toUserId,
    toDeviceId,
    signalType,
    encryptedPayload,
  );

  /// Create a copy of CallSignalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallSignalRequestImplCopyWith<_$CallSignalRequestImpl> get copyWith =>
      __$$CallSignalRequestImplCopyWithImpl<_$CallSignalRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallSignalRequestImplToJson(this);
  }
}

abstract class _CallSignalRequest implements CallSignalRequest {
  const factory _CallSignalRequest({
    required final String callId,
    required final String toUserId,
    final String? toDeviceId,
    required final String signalType,
    required final String encryptedPayload,
  }) = _$CallSignalRequestImpl;

  factory _CallSignalRequest.fromJson(Map<String, dynamic> json) =
      _$CallSignalRequestImpl.fromJson;

  @override
  String get callId;
  @override
  String get toUserId;
  @override
  String? get toDeviceId;
  @override
  String get signalType;
  @override
  String get encryptedPayload;

  /// Create a copy of CallSignalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallSignalRequestImplCopyWith<_$CallSignalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AckCallEventsRequest _$AckCallEventsRequestFromJson(Map<String, dynamic> json) {
  return _AckCallEventsRequest.fromJson(json);
}

/// @nodoc
mixin _$AckCallEventsRequest {
  List<String> get eventIds => throw _privateConstructorUsedError;

  /// Serializes this AckCallEventsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AckCallEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AckCallEventsRequestCopyWith<AckCallEventsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AckCallEventsRequestCopyWith<$Res> {
  factory $AckCallEventsRequestCopyWith(
    AckCallEventsRequest value,
    $Res Function(AckCallEventsRequest) then,
  ) = _$AckCallEventsRequestCopyWithImpl<$Res, AckCallEventsRequest>;
  @useResult
  $Res call({List<String> eventIds});
}

/// @nodoc
class _$AckCallEventsRequestCopyWithImpl<
  $Res,
  $Val extends AckCallEventsRequest
>
    implements $AckCallEventsRequestCopyWith<$Res> {
  _$AckCallEventsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AckCallEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? eventIds = null}) {
    return _then(
      _value.copyWith(
            eventIds: null == eventIds
                ? _value.eventIds
                : eventIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AckCallEventsRequestImplCopyWith<$Res>
    implements $AckCallEventsRequestCopyWith<$Res> {
  factory _$$AckCallEventsRequestImplCopyWith(
    _$AckCallEventsRequestImpl value,
    $Res Function(_$AckCallEventsRequestImpl) then,
  ) = __$$AckCallEventsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> eventIds});
}

/// @nodoc
class __$$AckCallEventsRequestImplCopyWithImpl<$Res>
    extends _$AckCallEventsRequestCopyWithImpl<$Res, _$AckCallEventsRequestImpl>
    implements _$$AckCallEventsRequestImplCopyWith<$Res> {
  __$$AckCallEventsRequestImplCopyWithImpl(
    _$AckCallEventsRequestImpl _value,
    $Res Function(_$AckCallEventsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AckCallEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? eventIds = null}) {
    return _then(
      _$AckCallEventsRequestImpl(
        eventIds: null == eventIds
            ? _value._eventIds
            : eventIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AckCallEventsRequestImpl implements _AckCallEventsRequest {
  const _$AckCallEventsRequestImpl({required final List<String> eventIds})
    : _eventIds = eventIds;

  factory _$AckCallEventsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AckCallEventsRequestImplFromJson(json);

  final List<String> _eventIds;
  @override
  List<String> get eventIds {
    if (_eventIds is EqualUnmodifiableListView) return _eventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventIds);
  }

  @override
  String toString() {
    return 'AckCallEventsRequest(eventIds: $eventIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AckCallEventsRequestImpl &&
            const DeepCollectionEquality().equals(other._eventIds, _eventIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_eventIds));

  /// Create a copy of AckCallEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AckCallEventsRequestImplCopyWith<_$AckCallEventsRequestImpl>
  get copyWith =>
      __$$AckCallEventsRequestImplCopyWithImpl<_$AckCallEventsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AckCallEventsRequestImplToJson(this);
  }
}

abstract class _AckCallEventsRequest implements AckCallEventsRequest {
  const factory _AckCallEventsRequest({required final List<String> eventIds}) =
      _$AckCallEventsRequestImpl;

  factory _AckCallEventsRequest.fromJson(Map<String, dynamic> json) =
      _$AckCallEventsRequestImpl.fromJson;

  @override
  List<String> get eventIds;

  /// Create a copy of AckCallEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AckCallEventsRequestImplCopyWith<_$AckCallEventsRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
