// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nuke_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NukeInitiatedResponse _$NukeInitiatedResponseFromJson(
  Map<String, dynamic> json,
) {
  return _NukeInitiatedResponse.fromJson(json);
}

/// @nodoc
mixin _$NukeInitiatedResponse {
  String get nukeToken => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  int get countdown => throw _privateConstructorUsedError;

  /// Serializes this NukeInitiatedResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NukeInitiatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NukeInitiatedResponseCopyWith<NukeInitiatedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NukeInitiatedResponseCopyWith<$Res> {
  factory $NukeInitiatedResponseCopyWith(
    NukeInitiatedResponse value,
    $Res Function(NukeInitiatedResponse) then,
  ) = _$NukeInitiatedResponseCopyWithImpl<$Res, NukeInitiatedResponse>;
  @useResult
  $Res call({String nukeToken, DateTime expiresAt, int countdown});
}

/// @nodoc
class _$NukeInitiatedResponseCopyWithImpl<
  $Res,
  $Val extends NukeInitiatedResponse
>
    implements $NukeInitiatedResponseCopyWith<$Res> {
  _$NukeInitiatedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NukeInitiatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nukeToken = null,
    Object? expiresAt = null,
    Object? countdown = null,
  }) {
    return _then(
      _value.copyWith(
            nukeToken: null == nukeToken
                ? _value.nukeToken
                : nukeToken // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            countdown: null == countdown
                ? _value.countdown
                : countdown // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NukeInitiatedResponseImplCopyWith<$Res>
    implements $NukeInitiatedResponseCopyWith<$Res> {
  factory _$$NukeInitiatedResponseImplCopyWith(
    _$NukeInitiatedResponseImpl value,
    $Res Function(_$NukeInitiatedResponseImpl) then,
  ) = __$$NukeInitiatedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nukeToken, DateTime expiresAt, int countdown});
}

/// @nodoc
class __$$NukeInitiatedResponseImplCopyWithImpl<$Res>
    extends
        _$NukeInitiatedResponseCopyWithImpl<$Res, _$NukeInitiatedResponseImpl>
    implements _$$NukeInitiatedResponseImplCopyWith<$Res> {
  __$$NukeInitiatedResponseImplCopyWithImpl(
    _$NukeInitiatedResponseImpl _value,
    $Res Function(_$NukeInitiatedResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NukeInitiatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nukeToken = null,
    Object? expiresAt = null,
    Object? countdown = null,
  }) {
    return _then(
      _$NukeInitiatedResponseImpl(
        nukeToken: null == nukeToken
            ? _value.nukeToken
            : nukeToken // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        countdown: null == countdown
            ? _value.countdown
            : countdown // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NukeInitiatedResponseImpl implements _NukeInitiatedResponse {
  const _$NukeInitiatedResponseImpl({
    required this.nukeToken,
    required this.expiresAt,
    required this.countdown,
  });

  factory _$NukeInitiatedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NukeInitiatedResponseImplFromJson(json);

  @override
  final String nukeToken;
  @override
  final DateTime expiresAt;
  @override
  final int countdown;

  @override
  String toString() {
    return 'NukeInitiatedResponse(nukeToken: $nukeToken, expiresAt: $expiresAt, countdown: $countdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NukeInitiatedResponseImpl &&
            (identical(other.nukeToken, nukeToken) ||
                other.nukeToken == nukeToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.countdown, countdown) ||
                other.countdown == countdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nukeToken, expiresAt, countdown);

  /// Create a copy of NukeInitiatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NukeInitiatedResponseImplCopyWith<_$NukeInitiatedResponseImpl>
  get copyWith =>
      __$$NukeInitiatedResponseImplCopyWithImpl<_$NukeInitiatedResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NukeInitiatedResponseImplToJson(this);
  }
}

abstract class _NukeInitiatedResponse implements NukeInitiatedResponse {
  const factory _NukeInitiatedResponse({
    required final String nukeToken,
    required final DateTime expiresAt,
    required final int countdown,
  }) = _$NukeInitiatedResponseImpl;

  factory _NukeInitiatedResponse.fromJson(Map<String, dynamic> json) =
      _$NukeInitiatedResponseImpl.fromJson;

  @override
  String get nukeToken;
  @override
  DateTime get expiresAt;
  @override
  int get countdown;

  /// Create a copy of NukeInitiatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NukeInitiatedResponseImplCopyWith<_$NukeInitiatedResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

NukeRequest _$NukeRequestFromJson(Map<String, dynamic> json) {
  return _NukeRequest.fromJson(json);
}

/// @nodoc
mixin _$NukeRequest {
  String get mode => throw _privateConstructorUsedError;
  String? get nukeToken => throw _privateConstructorUsedError;
  String? get deviceKeySignature => throw _privateConstructorUsedError;

  /// Serializes this NukeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NukeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NukeRequestCopyWith<NukeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NukeRequestCopyWith<$Res> {
  factory $NukeRequestCopyWith(
    NukeRequest value,
    $Res Function(NukeRequest) then,
  ) = _$NukeRequestCopyWithImpl<$Res, NukeRequest>;
  @useResult
  $Res call({String mode, String? nukeToken, String? deviceKeySignature});
}

/// @nodoc
class _$NukeRequestCopyWithImpl<$Res, $Val extends NukeRequest>
    implements $NukeRequestCopyWith<$Res> {
  _$NukeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NukeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? nukeToken = freezed,
    Object? deviceKeySignature = freezed,
  }) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as String,
            nukeToken: freezed == nukeToken
                ? _value.nukeToken
                : nukeToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceKeySignature: freezed == deviceKeySignature
                ? _value.deviceKeySignature
                : deviceKeySignature // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NukeRequestImplCopyWith<$Res>
    implements $NukeRequestCopyWith<$Res> {
  factory _$$NukeRequestImplCopyWith(
    _$NukeRequestImpl value,
    $Res Function(_$NukeRequestImpl) then,
  ) = __$$NukeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String? nukeToken, String? deviceKeySignature});
}

/// @nodoc
class __$$NukeRequestImplCopyWithImpl<$Res>
    extends _$NukeRequestCopyWithImpl<$Res, _$NukeRequestImpl>
    implements _$$NukeRequestImplCopyWith<$Res> {
  __$$NukeRequestImplCopyWithImpl(
    _$NukeRequestImpl _value,
    $Res Function(_$NukeRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NukeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? nukeToken = freezed,
    Object? deviceKeySignature = freezed,
  }) {
    return _then(
      _$NukeRequestImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        nukeToken: freezed == nukeToken
            ? _value.nukeToken
            : nukeToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceKeySignature: freezed == deviceKeySignature
            ? _value.deviceKeySignature
            : deviceKeySignature // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NukeRequestImpl implements _NukeRequest {
  const _$NukeRequestImpl({
    this.mode = 'standard',
    this.nukeToken,
    this.deviceKeySignature,
  });

  factory _$NukeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$NukeRequestImplFromJson(json);

  @override
  @JsonKey()
  final String mode;
  @override
  final String? nukeToken;
  @override
  final String? deviceKeySignature;

  @override
  String toString() {
    return 'NukeRequest(mode: $mode, nukeToken: $nukeToken, deviceKeySignature: $deviceKeySignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NukeRequestImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.nukeToken, nukeToken) ||
                other.nukeToken == nukeToken) &&
            (identical(other.deviceKeySignature, deviceKeySignature) ||
                other.deviceKeySignature == deviceKeySignature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mode, nukeToken, deviceKeySignature);

  /// Create a copy of NukeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NukeRequestImplCopyWith<_$NukeRequestImpl> get copyWith =>
      __$$NukeRequestImplCopyWithImpl<_$NukeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NukeRequestImplToJson(this);
  }
}

abstract class _NukeRequest implements NukeRequest {
  const factory _NukeRequest({
    final String mode,
    final String? nukeToken,
    final String? deviceKeySignature,
  }) = _$NukeRequestImpl;

  factory _NukeRequest.fromJson(Map<String, dynamic> json) =
      _$NukeRequestImpl.fromJson;

  @override
  String get mode;
  @override
  String? get nukeToken;
  @override
  String? get deviceKeySignature;

  /// Create a copy of NukeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NukeRequestImplCopyWith<_$NukeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteAccountRequest _$DeleteAccountRequestFromJson(Map<String, dynamic> json) {
  return _DeleteAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$DeleteAccountRequest {
  String? get password => throw _privateConstructorUsedError;
  String get confirmation => throw _privateConstructorUsedError;

  /// Serializes this DeleteAccountRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteAccountRequestCopyWith<DeleteAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountRequestCopyWith<$Res> {
  factory $DeleteAccountRequestCopyWith(
    DeleteAccountRequest value,
    $Res Function(DeleteAccountRequest) then,
  ) = _$DeleteAccountRequestCopyWithImpl<$Res, DeleteAccountRequest>;
  @useResult
  $Res call({String? password, String confirmation});
}

/// @nodoc
class _$DeleteAccountRequestCopyWithImpl<
  $Res,
  $Val extends DeleteAccountRequest
>
    implements $DeleteAccountRequestCopyWith<$Res> {
  _$DeleteAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = freezed, Object? confirmation = null}) {
    return _then(
      _value.copyWith(
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            confirmation: null == confirmation
                ? _value.confirmation
                : confirmation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeleteAccountRequestImplCopyWith<$Res>
    implements $DeleteAccountRequestCopyWith<$Res> {
  factory _$$DeleteAccountRequestImplCopyWith(
    _$DeleteAccountRequestImpl value,
    $Res Function(_$DeleteAccountRequestImpl) then,
  ) = __$$DeleteAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? password, String confirmation});
}

/// @nodoc
class __$$DeleteAccountRequestImplCopyWithImpl<$Res>
    extends _$DeleteAccountRequestCopyWithImpl<$Res, _$DeleteAccountRequestImpl>
    implements _$$DeleteAccountRequestImplCopyWith<$Res> {
  __$$DeleteAccountRequestImplCopyWithImpl(
    _$DeleteAccountRequestImpl _value,
    $Res Function(_$DeleteAccountRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = freezed, Object? confirmation = null}) {
    return _then(
      _$DeleteAccountRequestImpl(
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        confirmation: null == confirmation
            ? _value.confirmation
            : confirmation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteAccountRequestImpl implements _DeleteAccountRequest {
  const _$DeleteAccountRequestImpl({this.password, required this.confirmation});

  factory _$DeleteAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteAccountRequestImplFromJson(json);

  @override
  final String? password;
  @override
  final String confirmation;

  @override
  String toString() {
    return 'DeleteAccountRequest(password: $password, confirmation: $confirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountRequestImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmation, confirmation) ||
                other.confirmation == confirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, password, confirmation);

  /// Create a copy of DeleteAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountRequestImplCopyWith<_$DeleteAccountRequestImpl>
  get copyWith =>
      __$$DeleteAccountRequestImplCopyWithImpl<_$DeleteAccountRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteAccountRequestImplToJson(this);
  }
}

abstract class _DeleteAccountRequest implements DeleteAccountRequest {
  const factory _DeleteAccountRequest({
    final String? password,
    required final String confirmation,
  }) = _$DeleteAccountRequestImpl;

  factory _DeleteAccountRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteAccountRequestImpl.fromJson;

  @override
  String? get password;
  @override
  String get confirmation;

  /// Create a copy of DeleteAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteAccountRequestImplCopyWith<_$DeleteAccountRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
