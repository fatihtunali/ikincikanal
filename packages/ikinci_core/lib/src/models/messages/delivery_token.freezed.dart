// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeliveryToken _$DeliveryTokenFromJson(Map<String, dynamic> json) {
  return _DeliveryToken.fromJson(json);
}

/// @nodoc
mixin _$DeliveryToken {
  String get token => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String? get forUserId => throw _privateConstructorUsedError;

  /// Serializes this DeliveryToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryTokenCopyWith<DeliveryToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTokenCopyWith<$Res> {
  factory $DeliveryTokenCopyWith(
    DeliveryToken value,
    $Res Function(DeliveryToken) then,
  ) = _$DeliveryTokenCopyWithImpl<$Res, DeliveryToken>;
  @useResult
  $Res call({String token, DateTime expiresAt, String? forUserId});
}

/// @nodoc
class _$DeliveryTokenCopyWithImpl<$Res, $Val extends DeliveryToken>
    implements $DeliveryTokenCopyWith<$Res> {
  _$DeliveryTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expiresAt = null,
    Object? forUserId = freezed,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            forUserId: freezed == forUserId
                ? _value.forUserId
                : forUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryTokenImplCopyWith<$Res>
    implements $DeliveryTokenCopyWith<$Res> {
  factory _$$DeliveryTokenImplCopyWith(
    _$DeliveryTokenImpl value,
    $Res Function(_$DeliveryTokenImpl) then,
  ) = __$$DeliveryTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, DateTime expiresAt, String? forUserId});
}

/// @nodoc
class __$$DeliveryTokenImplCopyWithImpl<$Res>
    extends _$DeliveryTokenCopyWithImpl<$Res, _$DeliveryTokenImpl>
    implements _$$DeliveryTokenImplCopyWith<$Res> {
  __$$DeliveryTokenImplCopyWithImpl(
    _$DeliveryTokenImpl _value,
    $Res Function(_$DeliveryTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expiresAt = null,
    Object? forUserId = freezed,
  }) {
    return _then(
      _$DeliveryTokenImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        forUserId: freezed == forUserId
            ? _value.forUserId
            : forUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryTokenImpl implements _DeliveryToken {
  const _$DeliveryTokenImpl({
    required this.token,
    required this.expiresAt,
    this.forUserId,
  });

  factory _$DeliveryTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryTokenImplFromJson(json);

  @override
  final String token;
  @override
  final DateTime expiresAt;
  @override
  final String? forUserId;

  @override
  String toString() {
    return 'DeliveryToken(token: $token, expiresAt: $expiresAt, forUserId: $forUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.forUserId, forUserId) ||
                other.forUserId == forUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, expiresAt, forUserId);

  /// Create a copy of DeliveryToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryTokenImplCopyWith<_$DeliveryTokenImpl> get copyWith =>
      __$$DeliveryTokenImplCopyWithImpl<_$DeliveryTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryTokenImplToJson(this);
  }
}

abstract class _DeliveryToken implements DeliveryToken {
  const factory _DeliveryToken({
    required final String token,
    required final DateTime expiresAt,
    final String? forUserId,
  }) = _$DeliveryTokenImpl;

  factory _DeliveryToken.fromJson(Map<String, dynamic> json) =
      _$DeliveryTokenImpl.fromJson;

  @override
  String get token;
  @override
  DateTime get expiresAt;
  @override
  String? get forUserId;

  /// Create a copy of DeliveryToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryTokenImplCopyWith<_$DeliveryTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDeliveryTokenRequest _$CreateDeliveryTokenRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateDeliveryTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateDeliveryTokenRequest {
  String get forSenderType => throw _privateConstructorUsedError;
  String get forSenderValue => throw _privateConstructorUsedError;
  int get expiresInSeconds => throw _privateConstructorUsedError;
  int get maxPayloadBytes => throw _privateConstructorUsedError;
  bool get requireProofOfWork => throw _privateConstructorUsedError;

  /// Serializes this CreateDeliveryTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryTokenRequestCopyWith<CreateDeliveryTokenRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryTokenRequestCopyWith<$Res> {
  factory $CreateDeliveryTokenRequestCopyWith(
    CreateDeliveryTokenRequest value,
    $Res Function(CreateDeliveryTokenRequest) then,
  ) =
      _$CreateDeliveryTokenRequestCopyWithImpl<
        $Res,
        CreateDeliveryTokenRequest
      >;
  @useResult
  $Res call({
    String forSenderType,
    String forSenderValue,
    int expiresInSeconds,
    int maxPayloadBytes,
    bool requireProofOfWork,
  });
}

/// @nodoc
class _$CreateDeliveryTokenRequestCopyWithImpl<
  $Res,
  $Val extends CreateDeliveryTokenRequest
>
    implements $CreateDeliveryTokenRequestCopyWith<$Res> {
  _$CreateDeliveryTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forSenderType = null,
    Object? forSenderValue = null,
    Object? expiresInSeconds = null,
    Object? maxPayloadBytes = null,
    Object? requireProofOfWork = null,
  }) {
    return _then(
      _value.copyWith(
            forSenderType: null == forSenderType
                ? _value.forSenderType
                : forSenderType // ignore: cast_nullable_to_non_nullable
                      as String,
            forSenderValue: null == forSenderValue
                ? _value.forSenderValue
                : forSenderValue // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresInSeconds: null == expiresInSeconds
                ? _value.expiresInSeconds
                : expiresInSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            maxPayloadBytes: null == maxPayloadBytes
                ? _value.maxPayloadBytes
                : maxPayloadBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            requireProofOfWork: null == requireProofOfWork
                ? _value.requireProofOfWork
                : requireProofOfWork // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateDeliveryTokenRequestImplCopyWith<$Res>
    implements $CreateDeliveryTokenRequestCopyWith<$Res> {
  factory _$$CreateDeliveryTokenRequestImplCopyWith(
    _$CreateDeliveryTokenRequestImpl value,
    $Res Function(_$CreateDeliveryTokenRequestImpl) then,
  ) = __$$CreateDeliveryTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String forSenderType,
    String forSenderValue,
    int expiresInSeconds,
    int maxPayloadBytes,
    bool requireProofOfWork,
  });
}

/// @nodoc
class __$$CreateDeliveryTokenRequestImplCopyWithImpl<$Res>
    extends
        _$CreateDeliveryTokenRequestCopyWithImpl<
          $Res,
          _$CreateDeliveryTokenRequestImpl
        >
    implements _$$CreateDeliveryTokenRequestImplCopyWith<$Res> {
  __$$CreateDeliveryTokenRequestImplCopyWithImpl(
    _$CreateDeliveryTokenRequestImpl _value,
    $Res Function(_$CreateDeliveryTokenRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateDeliveryTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forSenderType = null,
    Object? forSenderValue = null,
    Object? expiresInSeconds = null,
    Object? maxPayloadBytes = null,
    Object? requireProofOfWork = null,
  }) {
    return _then(
      _$CreateDeliveryTokenRequestImpl(
        forSenderType: null == forSenderType
            ? _value.forSenderType
            : forSenderType // ignore: cast_nullable_to_non_nullable
                  as String,
        forSenderValue: null == forSenderValue
            ? _value.forSenderValue
            : forSenderValue // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresInSeconds: null == expiresInSeconds
            ? _value.expiresInSeconds
            : expiresInSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPayloadBytes: null == maxPayloadBytes
            ? _value.maxPayloadBytes
            : maxPayloadBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        requireProofOfWork: null == requireProofOfWork
            ? _value.requireProofOfWork
            : requireProofOfWork // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDeliveryTokenRequestImpl implements _CreateDeliveryTokenRequest {
  const _$CreateDeliveryTokenRequestImpl({
    required this.forSenderType,
    required this.forSenderValue,
    this.expiresInSeconds = 3600,
    this.maxPayloadBytes = 65536,
    this.requireProofOfWork = false,
  });

  factory _$CreateDeliveryTokenRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateDeliveryTokenRequestImplFromJson(json);

  @override
  final String forSenderType;
  @override
  final String forSenderValue;
  @override
  @JsonKey()
  final int expiresInSeconds;
  @override
  @JsonKey()
  final int maxPayloadBytes;
  @override
  @JsonKey()
  final bool requireProofOfWork;

  @override
  String toString() {
    return 'CreateDeliveryTokenRequest(forSenderType: $forSenderType, forSenderValue: $forSenderValue, expiresInSeconds: $expiresInSeconds, maxPayloadBytes: $maxPayloadBytes, requireProofOfWork: $requireProofOfWork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryTokenRequestImpl &&
            (identical(other.forSenderType, forSenderType) ||
                other.forSenderType == forSenderType) &&
            (identical(other.forSenderValue, forSenderValue) ||
                other.forSenderValue == forSenderValue) &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                other.expiresInSeconds == expiresInSeconds) &&
            (identical(other.maxPayloadBytes, maxPayloadBytes) ||
                other.maxPayloadBytes == maxPayloadBytes) &&
            (identical(other.requireProofOfWork, requireProofOfWork) ||
                other.requireProofOfWork == requireProofOfWork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    forSenderType,
    forSenderValue,
    expiresInSeconds,
    maxPayloadBytes,
    requireProofOfWork,
  );

  /// Create a copy of CreateDeliveryTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryTokenRequestImplCopyWith<_$CreateDeliveryTokenRequestImpl>
  get copyWith =>
      __$$CreateDeliveryTokenRequestImplCopyWithImpl<
        _$CreateDeliveryTokenRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDeliveryTokenRequestImplToJson(this);
  }
}

abstract class _CreateDeliveryTokenRequest
    implements CreateDeliveryTokenRequest {
  const factory _CreateDeliveryTokenRequest({
    required final String forSenderType,
    required final String forSenderValue,
    final int expiresInSeconds,
    final int maxPayloadBytes,
    final bool requireProofOfWork,
  }) = _$CreateDeliveryTokenRequestImpl;

  factory _CreateDeliveryTokenRequest.fromJson(Map<String, dynamic> json) =
      _$CreateDeliveryTokenRequestImpl.fromJson;

  @override
  String get forSenderType;
  @override
  String get forSenderValue;
  @override
  int get expiresInSeconds;
  @override
  int get maxPayloadBytes;
  @override
  bool get requireProofOfWork;

  /// Create a copy of CreateDeliveryTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryTokenRequestImplCopyWith<_$CreateDeliveryTokenRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
