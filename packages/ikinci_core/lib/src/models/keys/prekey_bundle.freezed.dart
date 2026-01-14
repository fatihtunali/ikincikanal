// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prekey_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreKeyBundle _$PreKeyBundleFromJson(Map<String, dynamic> json) {
  return _PreKeyBundle.fromJson(json);
}

/// @nodoc
mixin _$PreKeyBundle {
  String get userId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  int get registrationId => throw _privateConstructorUsedError;
  String get identityKeyPub => throw _privateConstructorUsedError;
  SignedPreKey get signedPreKey => throw _privateConstructorUsedError;
  OneTimePreKey? get oneTimePreKey => throw _privateConstructorUsedError;

  /// Serializes this PreKeyBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreKeyBundleCopyWith<PreKeyBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreKeyBundleCopyWith<$Res> {
  factory $PreKeyBundleCopyWith(
    PreKeyBundle value,
    $Res Function(PreKeyBundle) then,
  ) = _$PreKeyBundleCopyWithImpl<$Res, PreKeyBundle>;
  @useResult
  $Res call({
    String userId,
    String deviceId,
    int registrationId,
    String identityKeyPub,
    SignedPreKey signedPreKey,
    OneTimePreKey? oneTimePreKey,
  });

  $SignedPreKeyCopyWith<$Res> get signedPreKey;
  $OneTimePreKeyCopyWith<$Res>? get oneTimePreKey;
}

/// @nodoc
class _$PreKeyBundleCopyWithImpl<$Res, $Val extends PreKeyBundle>
    implements $PreKeyBundleCopyWith<$Res> {
  _$PreKeyBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
    Object? signedPreKey = null,
    Object? oneTimePreKey = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            registrationId: null == registrationId
                ? _value.registrationId
                : registrationId // ignore: cast_nullable_to_non_nullable
                      as int,
            identityKeyPub: null == identityKeyPub
                ? _value.identityKeyPub
                : identityKeyPub // ignore: cast_nullable_to_non_nullable
                      as String,
            signedPreKey: null == signedPreKey
                ? _value.signedPreKey
                : signedPreKey // ignore: cast_nullable_to_non_nullable
                      as SignedPreKey,
            oneTimePreKey: freezed == oneTimePreKey
                ? _value.oneTimePreKey
                : oneTimePreKey // ignore: cast_nullable_to_non_nullable
                      as OneTimePreKey?,
          )
          as $Val,
    );
  }

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedPreKeyCopyWith<$Res> get signedPreKey {
    return $SignedPreKeyCopyWith<$Res>(_value.signedPreKey, (value) {
      return _then(_value.copyWith(signedPreKey: value) as $Val);
    });
  }

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OneTimePreKeyCopyWith<$Res>? get oneTimePreKey {
    if (_value.oneTimePreKey == null) {
      return null;
    }

    return $OneTimePreKeyCopyWith<$Res>(_value.oneTimePreKey!, (value) {
      return _then(_value.copyWith(oneTimePreKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreKeyBundleImplCopyWith<$Res>
    implements $PreKeyBundleCopyWith<$Res> {
  factory _$$PreKeyBundleImplCopyWith(
    _$PreKeyBundleImpl value,
    $Res Function(_$PreKeyBundleImpl) then,
  ) = __$$PreKeyBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String deviceId,
    int registrationId,
    String identityKeyPub,
    SignedPreKey signedPreKey,
    OneTimePreKey? oneTimePreKey,
  });

  @override
  $SignedPreKeyCopyWith<$Res> get signedPreKey;
  @override
  $OneTimePreKeyCopyWith<$Res>? get oneTimePreKey;
}

/// @nodoc
class __$$PreKeyBundleImplCopyWithImpl<$Res>
    extends _$PreKeyBundleCopyWithImpl<$Res, _$PreKeyBundleImpl>
    implements _$$PreKeyBundleImplCopyWith<$Res> {
  __$$PreKeyBundleImplCopyWithImpl(
    _$PreKeyBundleImpl _value,
    $Res Function(_$PreKeyBundleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
    Object? signedPreKey = null,
    Object? oneTimePreKey = freezed,
  }) {
    return _then(
      _$PreKeyBundleImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        registrationId: null == registrationId
            ? _value.registrationId
            : registrationId // ignore: cast_nullable_to_non_nullable
                  as int,
        identityKeyPub: null == identityKeyPub
            ? _value.identityKeyPub
            : identityKeyPub // ignore: cast_nullable_to_non_nullable
                  as String,
        signedPreKey: null == signedPreKey
            ? _value.signedPreKey
            : signedPreKey // ignore: cast_nullable_to_non_nullable
                  as SignedPreKey,
        oneTimePreKey: freezed == oneTimePreKey
            ? _value.oneTimePreKey
            : oneTimePreKey // ignore: cast_nullable_to_non_nullable
                  as OneTimePreKey?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreKeyBundleImpl implements _PreKeyBundle {
  const _$PreKeyBundleImpl({
    required this.userId,
    required this.deviceId,
    required this.registrationId,
    required this.identityKeyPub,
    required this.signedPreKey,
    this.oneTimePreKey,
  });

  factory _$PreKeyBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreKeyBundleImplFromJson(json);

  @override
  final String userId;
  @override
  final String deviceId;
  @override
  final int registrationId;
  @override
  final String identityKeyPub;
  @override
  final SignedPreKey signedPreKey;
  @override
  final OneTimePreKey? oneTimePreKey;

  @override
  String toString() {
    return 'PreKeyBundle(userId: $userId, deviceId: $deviceId, registrationId: $registrationId, identityKeyPub: $identityKeyPub, signedPreKey: $signedPreKey, oneTimePreKey: $oneTimePreKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreKeyBundleImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.identityKeyPub, identityKeyPub) ||
                other.identityKeyPub == identityKeyPub) &&
            (identical(other.signedPreKey, signedPreKey) ||
                other.signedPreKey == signedPreKey) &&
            (identical(other.oneTimePreKey, oneTimePreKey) ||
                other.oneTimePreKey == oneTimePreKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    deviceId,
    registrationId,
    identityKeyPub,
    signedPreKey,
    oneTimePreKey,
  );

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreKeyBundleImplCopyWith<_$PreKeyBundleImpl> get copyWith =>
      __$$PreKeyBundleImplCopyWithImpl<_$PreKeyBundleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreKeyBundleImplToJson(this);
  }
}

abstract class _PreKeyBundle implements PreKeyBundle {
  const factory _PreKeyBundle({
    required final String userId,
    required final String deviceId,
    required final int registrationId,
    required final String identityKeyPub,
    required final SignedPreKey signedPreKey,
    final OneTimePreKey? oneTimePreKey,
  }) = _$PreKeyBundleImpl;

  factory _PreKeyBundle.fromJson(Map<String, dynamic> json) =
      _$PreKeyBundleImpl.fromJson;

  @override
  String get userId;
  @override
  String get deviceId;
  @override
  int get registrationId;
  @override
  String get identityKeyPub;
  @override
  SignedPreKey get signedPreKey;
  @override
  OneTimePreKey? get oneTimePreKey;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreKeyBundleImplCopyWith<_$PreKeyBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyCountResponse _$KeyCountResponseFromJson(Map<String, dynamic> json) {
  return _KeyCountResponse.fromJson(json);
}

/// @nodoc
mixin _$KeyCountResponse {
  int get oneTimeKeyCount => throw _privateConstructorUsedError;
  int get recommendedMinimum => throw _privateConstructorUsedError;

  /// Serializes this KeyCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeyCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeyCountResponseCopyWith<KeyCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyCountResponseCopyWith<$Res> {
  factory $KeyCountResponseCopyWith(
    KeyCountResponse value,
    $Res Function(KeyCountResponse) then,
  ) = _$KeyCountResponseCopyWithImpl<$Res, KeyCountResponse>;
  @useResult
  $Res call({int oneTimeKeyCount, int recommendedMinimum});
}

/// @nodoc
class _$KeyCountResponseCopyWithImpl<$Res, $Val extends KeyCountResponse>
    implements $KeyCountResponseCopyWith<$Res> {
  _$KeyCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeyCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneTimeKeyCount = null,
    Object? recommendedMinimum = null,
  }) {
    return _then(
      _value.copyWith(
            oneTimeKeyCount: null == oneTimeKeyCount
                ? _value.oneTimeKeyCount
                : oneTimeKeyCount // ignore: cast_nullable_to_non_nullable
                      as int,
            recommendedMinimum: null == recommendedMinimum
                ? _value.recommendedMinimum
                : recommendedMinimum // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KeyCountResponseImplCopyWith<$Res>
    implements $KeyCountResponseCopyWith<$Res> {
  factory _$$KeyCountResponseImplCopyWith(
    _$KeyCountResponseImpl value,
    $Res Function(_$KeyCountResponseImpl) then,
  ) = __$$KeyCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int oneTimeKeyCount, int recommendedMinimum});
}

/// @nodoc
class __$$KeyCountResponseImplCopyWithImpl<$Res>
    extends _$KeyCountResponseCopyWithImpl<$Res, _$KeyCountResponseImpl>
    implements _$$KeyCountResponseImplCopyWith<$Res> {
  __$$KeyCountResponseImplCopyWithImpl(
    _$KeyCountResponseImpl _value,
    $Res Function(_$KeyCountResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KeyCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneTimeKeyCount = null,
    Object? recommendedMinimum = null,
  }) {
    return _then(
      _$KeyCountResponseImpl(
        oneTimeKeyCount: null == oneTimeKeyCount
            ? _value.oneTimeKeyCount
            : oneTimeKeyCount // ignore: cast_nullable_to_non_nullable
                  as int,
        recommendedMinimum: null == recommendedMinimum
            ? _value.recommendedMinimum
            : recommendedMinimum // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KeyCountResponseImpl implements _KeyCountResponse {
  const _$KeyCountResponseImpl({
    required this.oneTimeKeyCount,
    required this.recommendedMinimum,
  });

  factory _$KeyCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeyCountResponseImplFromJson(json);

  @override
  final int oneTimeKeyCount;
  @override
  final int recommendedMinimum;

  @override
  String toString() {
    return 'KeyCountResponse(oneTimeKeyCount: $oneTimeKeyCount, recommendedMinimum: $recommendedMinimum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyCountResponseImpl &&
            (identical(other.oneTimeKeyCount, oneTimeKeyCount) ||
                other.oneTimeKeyCount == oneTimeKeyCount) &&
            (identical(other.recommendedMinimum, recommendedMinimum) ||
                other.recommendedMinimum == recommendedMinimum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, oneTimeKeyCount, recommendedMinimum);

  /// Create a copy of KeyCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyCountResponseImplCopyWith<_$KeyCountResponseImpl> get copyWith =>
      __$$KeyCountResponseImplCopyWithImpl<_$KeyCountResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KeyCountResponseImplToJson(this);
  }
}

abstract class _KeyCountResponse implements KeyCountResponse {
  const factory _KeyCountResponse({
    required final int oneTimeKeyCount,
    required final int recommendedMinimum,
  }) = _$KeyCountResponseImpl;

  factory _KeyCountResponse.fromJson(Map<String, dynamic> json) =
      _$KeyCountResponseImpl.fromJson;

  @override
  int get oneTimeKeyCount;
  @override
  int get recommendedMinimum;

  /// Create a copy of KeyCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyCountResponseImplCopyWith<_$KeyCountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadKeysResponse _$UploadKeysResponseFromJson(Map<String, dynamic> json) {
  return _UploadKeysResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadKeysResponse {
  bool get ok => throw _privateConstructorUsedError;
  int get remainingOneTimeKeys => throw _privateConstructorUsedError;
  DateTime get serverTime => throw _privateConstructorUsedError;

  /// Serializes this UploadKeysResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadKeysResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadKeysResponseCopyWith<UploadKeysResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadKeysResponseCopyWith<$Res> {
  factory $UploadKeysResponseCopyWith(
    UploadKeysResponse value,
    $Res Function(UploadKeysResponse) then,
  ) = _$UploadKeysResponseCopyWithImpl<$Res, UploadKeysResponse>;
  @useResult
  $Res call({bool ok, int remainingOneTimeKeys, DateTime serverTime});
}

/// @nodoc
class _$UploadKeysResponseCopyWithImpl<$Res, $Val extends UploadKeysResponse>
    implements $UploadKeysResponseCopyWith<$Res> {
  _$UploadKeysResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadKeysResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? remainingOneTimeKeys = null,
    Object? serverTime = null,
  }) {
    return _then(
      _value.copyWith(
            ok: null == ok
                ? _value.ok
                : ok // ignore: cast_nullable_to_non_nullable
                      as bool,
            remainingOneTimeKeys: null == remainingOneTimeKeys
                ? _value.remainingOneTimeKeys
                : remainingOneTimeKeys // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$UploadKeysResponseImplCopyWith<$Res>
    implements $UploadKeysResponseCopyWith<$Res> {
  factory _$$UploadKeysResponseImplCopyWith(
    _$UploadKeysResponseImpl value,
    $Res Function(_$UploadKeysResponseImpl) then,
  ) = __$$UploadKeysResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool ok, int remainingOneTimeKeys, DateTime serverTime});
}

/// @nodoc
class __$$UploadKeysResponseImplCopyWithImpl<$Res>
    extends _$UploadKeysResponseCopyWithImpl<$Res, _$UploadKeysResponseImpl>
    implements _$$UploadKeysResponseImplCopyWith<$Res> {
  __$$UploadKeysResponseImplCopyWithImpl(
    _$UploadKeysResponseImpl _value,
    $Res Function(_$UploadKeysResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadKeysResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? remainingOneTimeKeys = null,
    Object? serverTime = null,
  }) {
    return _then(
      _$UploadKeysResponseImpl(
        ok: null == ok
            ? _value.ok
            : ok // ignore: cast_nullable_to_non_nullable
                  as bool,
        remainingOneTimeKeys: null == remainingOneTimeKeys
            ? _value.remainingOneTimeKeys
            : remainingOneTimeKeys // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$UploadKeysResponseImpl implements _UploadKeysResponse {
  const _$UploadKeysResponseImpl({
    required this.ok,
    required this.remainingOneTimeKeys,
    required this.serverTime,
  });

  factory _$UploadKeysResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadKeysResponseImplFromJson(json);

  @override
  final bool ok;
  @override
  final int remainingOneTimeKeys;
  @override
  final DateTime serverTime;

  @override
  String toString() {
    return 'UploadKeysResponse(ok: $ok, remainingOneTimeKeys: $remainingOneTimeKeys, serverTime: $serverTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadKeysResponseImpl &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.remainingOneTimeKeys, remainingOneTimeKeys) ||
                other.remainingOneTimeKeys == remainingOneTimeKeys) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ok, remainingOneTimeKeys, serverTime);

  /// Create a copy of UploadKeysResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadKeysResponseImplCopyWith<_$UploadKeysResponseImpl> get copyWith =>
      __$$UploadKeysResponseImplCopyWithImpl<_$UploadKeysResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadKeysResponseImplToJson(this);
  }
}

abstract class _UploadKeysResponse implements UploadKeysResponse {
  const factory _UploadKeysResponse({
    required final bool ok,
    required final int remainingOneTimeKeys,
    required final DateTime serverTime,
  }) = _$UploadKeysResponseImpl;

  factory _UploadKeysResponse.fromJson(Map<String, dynamic> json) =
      _$UploadKeysResponseImpl.fromJson;

  @override
  bool get ok;
  @override
  int get remainingOneTimeKeys;
  @override
  DateTime get serverTime;

  /// Create a copy of UploadKeysResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadKeysResponseImplCopyWith<_$UploadKeysResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
