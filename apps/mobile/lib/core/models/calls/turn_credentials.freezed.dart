// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TurnCredentials _$TurnCredentialsFromJson(Map<String, dynamic> json) {
  return _TurnCredentials.fromJson(json);
}

/// @nodoc
mixin _$TurnCredentials {
  List<String> get urls => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get credential => throw _privateConstructorUsedError;
  int get ttlSeconds => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String get iceTransportPolicy => throw _privateConstructorUsedError;

  /// Serializes this TurnCredentials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TurnCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TurnCredentialsCopyWith<TurnCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnCredentialsCopyWith<$Res> {
  factory $TurnCredentialsCopyWith(
    TurnCredentials value,
    $Res Function(TurnCredentials) then,
  ) = _$TurnCredentialsCopyWithImpl<$Res, TurnCredentials>;
  @useResult
  $Res call({
    List<String> urls,
    String username,
    String credential,
    int ttlSeconds,
    DateTime expiresAt,
    String iceTransportPolicy,
  });
}

/// @nodoc
class _$TurnCredentialsCopyWithImpl<$Res, $Val extends TurnCredentials>
    implements $TurnCredentialsCopyWith<$Res> {
  _$TurnCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TurnCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? username = null,
    Object? credential = null,
    Object? ttlSeconds = null,
    Object? expiresAt = null,
    Object? iceTransportPolicy = null,
  }) {
    return _then(
      _value.copyWith(
            urls: null == urls
                ? _value.urls
                : urls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            credential: null == credential
                ? _value.credential
                : credential // ignore: cast_nullable_to_non_nullable
                      as String,
            ttlSeconds: null == ttlSeconds
                ? _value.ttlSeconds
                : ttlSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            iceTransportPolicy: null == iceTransportPolicy
                ? _value.iceTransportPolicy
                : iceTransportPolicy // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TurnCredentialsImplCopyWith<$Res>
    implements $TurnCredentialsCopyWith<$Res> {
  factory _$$TurnCredentialsImplCopyWith(
    _$TurnCredentialsImpl value,
    $Res Function(_$TurnCredentialsImpl) then,
  ) = __$$TurnCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> urls,
    String username,
    String credential,
    int ttlSeconds,
    DateTime expiresAt,
    String iceTransportPolicy,
  });
}

/// @nodoc
class __$$TurnCredentialsImplCopyWithImpl<$Res>
    extends _$TurnCredentialsCopyWithImpl<$Res, _$TurnCredentialsImpl>
    implements _$$TurnCredentialsImplCopyWith<$Res> {
  __$$TurnCredentialsImplCopyWithImpl(
    _$TurnCredentialsImpl _value,
    $Res Function(_$TurnCredentialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TurnCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? username = null,
    Object? credential = null,
    Object? ttlSeconds = null,
    Object? expiresAt = null,
    Object? iceTransportPolicy = null,
  }) {
    return _then(
      _$TurnCredentialsImpl(
        urls: null == urls
            ? _value._urls
            : urls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        credential: null == credential
            ? _value.credential
            : credential // ignore: cast_nullable_to_non_nullable
                  as String,
        ttlSeconds: null == ttlSeconds
            ? _value.ttlSeconds
            : ttlSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        iceTransportPolicy: null == iceTransportPolicy
            ? _value.iceTransportPolicy
            : iceTransportPolicy // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnCredentialsImpl implements _TurnCredentials {
  const _$TurnCredentialsImpl({
    required final List<String> urls,
    required this.username,
    required this.credential,
    required this.ttlSeconds,
    required this.expiresAt,
    this.iceTransportPolicy = 'relay',
  }) : _urls = urls;

  factory _$TurnCredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnCredentialsImplFromJson(json);

  final List<String> _urls;
  @override
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  final String username;
  @override
  final String credential;
  @override
  final int ttlSeconds;
  @override
  final DateTime expiresAt;
  @override
  @JsonKey()
  final String iceTransportPolicy;

  @override
  String toString() {
    return 'TurnCredentials(urls: $urls, username: $username, credential: $credential, ttlSeconds: $ttlSeconds, expiresAt: $expiresAt, iceTransportPolicy: $iceTransportPolicy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnCredentialsImpl &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.credential, credential) ||
                other.credential == credential) &&
            (identical(other.ttlSeconds, ttlSeconds) ||
                other.ttlSeconds == ttlSeconds) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.iceTransportPolicy, iceTransportPolicy) ||
                other.iceTransportPolicy == iceTransportPolicy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_urls),
    username,
    credential,
    ttlSeconds,
    expiresAt,
    iceTransportPolicy,
  );

  /// Create a copy of TurnCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnCredentialsImplCopyWith<_$TurnCredentialsImpl> get copyWith =>
      __$$TurnCredentialsImplCopyWithImpl<_$TurnCredentialsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnCredentialsImplToJson(this);
  }
}

abstract class _TurnCredentials implements TurnCredentials {
  const factory _TurnCredentials({
    required final List<String> urls,
    required final String username,
    required final String credential,
    required final int ttlSeconds,
    required final DateTime expiresAt,
    final String iceTransportPolicy,
  }) = _$TurnCredentialsImpl;

  factory _TurnCredentials.fromJson(Map<String, dynamic> json) =
      _$TurnCredentialsImpl.fromJson;

  @override
  List<String> get urls;
  @override
  String get username;
  @override
  String get credential;
  @override
  int get ttlSeconds;
  @override
  DateTime get expiresAt;
  @override
  String get iceTransportPolicy;

  /// Create a copy of TurnCredentials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TurnCredentialsImplCopyWith<_$TurnCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
