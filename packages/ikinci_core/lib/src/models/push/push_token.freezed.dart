// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpsertPushTokenRequest _$UpsertPushTokenRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpsertPushTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$UpsertPushTokenRequest {
  String get provider => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String? get endpoint => throw _privateConstructorUsedError;
  String? get appBundleId => throw _privateConstructorUsedError;

  /// Serializes this UpsertPushTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpsertPushTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpsertPushTokenRequestCopyWith<UpsertPushTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsertPushTokenRequestCopyWith<$Res> {
  factory $UpsertPushTokenRequestCopyWith(
    UpsertPushTokenRequest value,
    $Res Function(UpsertPushTokenRequest) then,
  ) = _$UpsertPushTokenRequestCopyWithImpl<$Res, UpsertPushTokenRequest>;
  @useResult
  $Res call({
    String provider,
    String token,
    String? endpoint,
    String? appBundleId,
  });
}

/// @nodoc
class _$UpsertPushTokenRequestCopyWithImpl<
  $Res,
  $Val extends UpsertPushTokenRequest
>
    implements $UpsertPushTokenRequestCopyWith<$Res> {
  _$UpsertPushTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpsertPushTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? token = null,
    Object? endpoint = freezed,
    Object? appBundleId = freezed,
  }) {
    return _then(
      _value.copyWith(
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            endpoint: freezed == endpoint
                ? _value.endpoint
                : endpoint // ignore: cast_nullable_to_non_nullable
                      as String?,
            appBundleId: freezed == appBundleId
                ? _value.appBundleId
                : appBundleId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpsertPushTokenRequestImplCopyWith<$Res>
    implements $UpsertPushTokenRequestCopyWith<$Res> {
  factory _$$UpsertPushTokenRequestImplCopyWith(
    _$UpsertPushTokenRequestImpl value,
    $Res Function(_$UpsertPushTokenRequestImpl) then,
  ) = __$$UpsertPushTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String provider,
    String token,
    String? endpoint,
    String? appBundleId,
  });
}

/// @nodoc
class __$$UpsertPushTokenRequestImplCopyWithImpl<$Res>
    extends
        _$UpsertPushTokenRequestCopyWithImpl<$Res, _$UpsertPushTokenRequestImpl>
    implements _$$UpsertPushTokenRequestImplCopyWith<$Res> {
  __$$UpsertPushTokenRequestImplCopyWithImpl(
    _$UpsertPushTokenRequestImpl _value,
    $Res Function(_$UpsertPushTokenRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpsertPushTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? token = null,
    Object? endpoint = freezed,
    Object? appBundleId = freezed,
  }) {
    return _then(
      _$UpsertPushTokenRequestImpl(
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        appBundleId: freezed == appBundleId
            ? _value.appBundleId
            : appBundleId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpsertPushTokenRequestImpl implements _UpsertPushTokenRequest {
  const _$UpsertPushTokenRequestImpl({
    required this.provider,
    required this.token,
    this.endpoint,
    this.appBundleId,
  });

  factory _$UpsertPushTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpsertPushTokenRequestImplFromJson(json);

  @override
  final String provider;
  @override
  final String token;
  @override
  final String? endpoint;
  @override
  final String? appBundleId;

  @override
  String toString() {
    return 'UpsertPushTokenRequest(provider: $provider, token: $token, endpoint: $endpoint, appBundleId: $appBundleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertPushTokenRequestImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.appBundleId, appBundleId) ||
                other.appBundleId == appBundleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provider, token, endpoint, appBundleId);

  /// Create a copy of UpsertPushTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertPushTokenRequestImplCopyWith<_$UpsertPushTokenRequestImpl>
  get copyWith =>
      __$$UpsertPushTokenRequestImplCopyWithImpl<_$UpsertPushTokenRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpsertPushTokenRequestImplToJson(this);
  }
}

abstract class _UpsertPushTokenRequest implements UpsertPushTokenRequest {
  const factory _UpsertPushTokenRequest({
    required final String provider,
    required final String token,
    final String? endpoint,
    final String? appBundleId,
  }) = _$UpsertPushTokenRequestImpl;

  factory _UpsertPushTokenRequest.fromJson(Map<String, dynamic> json) =
      _$UpsertPushTokenRequestImpl.fromJson;

  @override
  String get provider;
  @override
  String get token;
  @override
  String? get endpoint;
  @override
  String? get appBundleId;

  /// Create a copy of UpsertPushTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpsertPushTokenRequestImplCopyWith<_$UpsertPushTokenRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
