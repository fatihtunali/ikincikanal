// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prekey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignedPreKey _$SignedPreKeyFromJson(Map<String, dynamic> json) {
  return _SignedPreKey.fromJson(json);
}

/// @nodoc
mixin _$SignedPreKey {
  int get keyId => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;

  /// Serializes this SignedPreKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignedPreKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignedPreKeyCopyWith<SignedPreKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignedPreKeyCopyWith<$Res> {
  factory $SignedPreKeyCopyWith(
    SignedPreKey value,
    $Res Function(SignedPreKey) then,
  ) = _$SignedPreKeyCopyWithImpl<$Res, SignedPreKey>;
  @useResult
  $Res call({int keyId, String publicKey, String signature});
}

/// @nodoc
class _$SignedPreKeyCopyWithImpl<$Res, $Val extends SignedPreKey>
    implements $SignedPreKeyCopyWith<$Res> {
  _$SignedPreKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignedPreKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyId = null,
    Object? publicKey = null,
    Object? signature = null,
  }) {
    return _then(
      _value.copyWith(
            keyId: null == keyId
                ? _value.keyId
                : keyId // ignore: cast_nullable_to_non_nullable
                      as int,
            publicKey: null == publicKey
                ? _value.publicKey
                : publicKey // ignore: cast_nullable_to_non_nullable
                      as String,
            signature: null == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignedPreKeyImplCopyWith<$Res>
    implements $SignedPreKeyCopyWith<$Res> {
  factory _$$SignedPreKeyImplCopyWith(
    _$SignedPreKeyImpl value,
    $Res Function(_$SignedPreKeyImpl) then,
  ) = __$$SignedPreKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int keyId, String publicKey, String signature});
}

/// @nodoc
class __$$SignedPreKeyImplCopyWithImpl<$Res>
    extends _$SignedPreKeyCopyWithImpl<$Res, _$SignedPreKeyImpl>
    implements _$$SignedPreKeyImplCopyWith<$Res> {
  __$$SignedPreKeyImplCopyWithImpl(
    _$SignedPreKeyImpl _value,
    $Res Function(_$SignedPreKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignedPreKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyId = null,
    Object? publicKey = null,
    Object? signature = null,
  }) {
    return _then(
      _$SignedPreKeyImpl(
        keyId: null == keyId
            ? _value.keyId
            : keyId // ignore: cast_nullable_to_non_nullable
                  as int,
        publicKey: null == publicKey
            ? _value.publicKey
            : publicKey // ignore: cast_nullable_to_non_nullable
                  as String,
        signature: null == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignedPreKeyImpl implements _SignedPreKey {
  const _$SignedPreKeyImpl({
    required this.keyId,
    required this.publicKey,
    required this.signature,
  });

  factory _$SignedPreKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignedPreKeyImplFromJson(json);

  @override
  final int keyId;
  @override
  final String publicKey;
  @override
  final String signature;

  @override
  String toString() {
    return 'SignedPreKey(keyId: $keyId, publicKey: $publicKey, signature: $signature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedPreKeyImpl &&
            (identical(other.keyId, keyId) || other.keyId == keyId) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyId, publicKey, signature);

  /// Create a copy of SignedPreKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedPreKeyImplCopyWith<_$SignedPreKeyImpl> get copyWith =>
      __$$SignedPreKeyImplCopyWithImpl<_$SignedPreKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignedPreKeyImplToJson(this);
  }
}

abstract class _SignedPreKey implements SignedPreKey {
  const factory _SignedPreKey({
    required final int keyId,
    required final String publicKey,
    required final String signature,
  }) = _$SignedPreKeyImpl;

  factory _SignedPreKey.fromJson(Map<String, dynamic> json) =
      _$SignedPreKeyImpl.fromJson;

  @override
  int get keyId;
  @override
  String get publicKey;
  @override
  String get signature;

  /// Create a copy of SignedPreKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedPreKeyImplCopyWith<_$SignedPreKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OneTimePreKey _$OneTimePreKeyFromJson(Map<String, dynamic> json) {
  return _OneTimePreKey.fromJson(json);
}

/// @nodoc
mixin _$OneTimePreKey {
  int get keyId => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;

  /// Serializes this OneTimePreKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OneTimePreKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OneTimePreKeyCopyWith<OneTimePreKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneTimePreKeyCopyWith<$Res> {
  factory $OneTimePreKeyCopyWith(
    OneTimePreKey value,
    $Res Function(OneTimePreKey) then,
  ) = _$OneTimePreKeyCopyWithImpl<$Res, OneTimePreKey>;
  @useResult
  $Res call({int keyId, String publicKey});
}

/// @nodoc
class _$OneTimePreKeyCopyWithImpl<$Res, $Val extends OneTimePreKey>
    implements $OneTimePreKeyCopyWith<$Res> {
  _$OneTimePreKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OneTimePreKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyId = null, Object? publicKey = null}) {
    return _then(
      _value.copyWith(
            keyId: null == keyId
                ? _value.keyId
                : keyId // ignore: cast_nullable_to_non_nullable
                      as int,
            publicKey: null == publicKey
                ? _value.publicKey
                : publicKey // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OneTimePreKeyImplCopyWith<$Res>
    implements $OneTimePreKeyCopyWith<$Res> {
  factory _$$OneTimePreKeyImplCopyWith(
    _$OneTimePreKeyImpl value,
    $Res Function(_$OneTimePreKeyImpl) then,
  ) = __$$OneTimePreKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int keyId, String publicKey});
}

/// @nodoc
class __$$OneTimePreKeyImplCopyWithImpl<$Res>
    extends _$OneTimePreKeyCopyWithImpl<$Res, _$OneTimePreKeyImpl>
    implements _$$OneTimePreKeyImplCopyWith<$Res> {
  __$$OneTimePreKeyImplCopyWithImpl(
    _$OneTimePreKeyImpl _value,
    $Res Function(_$OneTimePreKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OneTimePreKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyId = null, Object? publicKey = null}) {
    return _then(
      _$OneTimePreKeyImpl(
        keyId: null == keyId
            ? _value.keyId
            : keyId // ignore: cast_nullable_to_non_nullable
                  as int,
        publicKey: null == publicKey
            ? _value.publicKey
            : publicKey // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OneTimePreKeyImpl implements _OneTimePreKey {
  const _$OneTimePreKeyImpl({required this.keyId, required this.publicKey});

  factory _$OneTimePreKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneTimePreKeyImplFromJson(json);

  @override
  final int keyId;
  @override
  final String publicKey;

  @override
  String toString() {
    return 'OneTimePreKey(keyId: $keyId, publicKey: $publicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneTimePreKeyImpl &&
            (identical(other.keyId, keyId) || other.keyId == keyId) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyId, publicKey);

  /// Create a copy of OneTimePreKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OneTimePreKeyImplCopyWith<_$OneTimePreKeyImpl> get copyWith =>
      __$$OneTimePreKeyImplCopyWithImpl<_$OneTimePreKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OneTimePreKeyImplToJson(this);
  }
}

abstract class _OneTimePreKey implements OneTimePreKey {
  const factory _OneTimePreKey({
    required final int keyId,
    required final String publicKey,
  }) = _$OneTimePreKeyImpl;

  factory _OneTimePreKey.fromJson(Map<String, dynamic> json) =
      _$OneTimePreKeyImpl.fromJson;

  @override
  int get keyId;
  @override
  String get publicKey;

  /// Create a copy of OneTimePreKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OneTimePreKeyImplCopyWith<_$OneTimePreKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InitialKeys _$InitialKeysFromJson(Map<String, dynamic> json) {
  return _InitialKeys.fromJson(json);
}

/// @nodoc
mixin _$InitialKeys {
  SignedPreKey get signedPreKey => throw _privateConstructorUsedError;
  List<OneTimePreKey> get oneTimePreKeys => throw _privateConstructorUsedError;

  /// Serializes this InitialKeys to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitialKeysCopyWith<InitialKeys> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialKeysCopyWith<$Res> {
  factory $InitialKeysCopyWith(
    InitialKeys value,
    $Res Function(InitialKeys) then,
  ) = _$InitialKeysCopyWithImpl<$Res, InitialKeys>;
  @useResult
  $Res call({SignedPreKey signedPreKey, List<OneTimePreKey> oneTimePreKeys});

  $SignedPreKeyCopyWith<$Res> get signedPreKey;
}

/// @nodoc
class _$InitialKeysCopyWithImpl<$Res, $Val extends InitialKeys>
    implements $InitialKeysCopyWith<$Res> {
  _$InitialKeysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signedPreKey = null, Object? oneTimePreKeys = null}) {
    return _then(
      _value.copyWith(
            signedPreKey: null == signedPreKey
                ? _value.signedPreKey
                : signedPreKey // ignore: cast_nullable_to_non_nullable
                      as SignedPreKey,
            oneTimePreKeys: null == oneTimePreKeys
                ? _value.oneTimePreKeys
                : oneTimePreKeys // ignore: cast_nullable_to_non_nullable
                      as List<OneTimePreKey>,
          )
          as $Val,
    );
  }

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedPreKeyCopyWith<$Res> get signedPreKey {
    return $SignedPreKeyCopyWith<$Res>(_value.signedPreKey, (value) {
      return _then(_value.copyWith(signedPreKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialKeysImplCopyWith<$Res>
    implements $InitialKeysCopyWith<$Res> {
  factory _$$InitialKeysImplCopyWith(
    _$InitialKeysImpl value,
    $Res Function(_$InitialKeysImpl) then,
  ) = __$$InitialKeysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignedPreKey signedPreKey, List<OneTimePreKey> oneTimePreKeys});

  @override
  $SignedPreKeyCopyWith<$Res> get signedPreKey;
}

/// @nodoc
class __$$InitialKeysImplCopyWithImpl<$Res>
    extends _$InitialKeysCopyWithImpl<$Res, _$InitialKeysImpl>
    implements _$$InitialKeysImplCopyWith<$Res> {
  __$$InitialKeysImplCopyWithImpl(
    _$InitialKeysImpl _value,
    $Res Function(_$InitialKeysImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signedPreKey = null, Object? oneTimePreKeys = null}) {
    return _then(
      _$InitialKeysImpl(
        signedPreKey: null == signedPreKey
            ? _value.signedPreKey
            : signedPreKey // ignore: cast_nullable_to_non_nullable
                  as SignedPreKey,
        oneTimePreKeys: null == oneTimePreKeys
            ? _value._oneTimePreKeys
            : oneTimePreKeys // ignore: cast_nullable_to_non_nullable
                  as List<OneTimePreKey>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InitialKeysImpl implements _InitialKeys {
  const _$InitialKeysImpl({
    required this.signedPreKey,
    required final List<OneTimePreKey> oneTimePreKeys,
  }) : _oneTimePreKeys = oneTimePreKeys;

  factory _$InitialKeysImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitialKeysImplFromJson(json);

  @override
  final SignedPreKey signedPreKey;
  final List<OneTimePreKey> _oneTimePreKeys;
  @override
  List<OneTimePreKey> get oneTimePreKeys {
    if (_oneTimePreKeys is EqualUnmodifiableListView) return _oneTimePreKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oneTimePreKeys);
  }

  @override
  String toString() {
    return 'InitialKeys(signedPreKey: $signedPreKey, oneTimePreKeys: $oneTimePreKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialKeysImpl &&
            (identical(other.signedPreKey, signedPreKey) ||
                other.signedPreKey == signedPreKey) &&
            const DeepCollectionEquality().equals(
              other._oneTimePreKeys,
              _oneTimePreKeys,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    signedPreKey,
    const DeepCollectionEquality().hash(_oneTimePreKeys),
  );

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialKeysImplCopyWith<_$InitialKeysImpl> get copyWith =>
      __$$InitialKeysImplCopyWithImpl<_$InitialKeysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitialKeysImplToJson(this);
  }
}

abstract class _InitialKeys implements InitialKeys {
  const factory _InitialKeys({
    required final SignedPreKey signedPreKey,
    required final List<OneTimePreKey> oneTimePreKeys,
  }) = _$InitialKeysImpl;

  factory _InitialKeys.fromJson(Map<String, dynamic> json) =
      _$InitialKeysImpl.fromJson;

  @override
  SignedPreKey get signedPreKey;
  @override
  List<OneTimePreKey> get oneTimePreKeys;

  /// Create a copy of InitialKeys
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialKeysImplCopyWith<_$InitialKeysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadKeysRequest _$UploadKeysRequestFromJson(Map<String, dynamic> json) {
  return _UploadKeysRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadKeysRequest {
  SignedPreKey get signedPreKey => throw _privateConstructorUsedError;
  List<OneTimePreKey> get oneTimePreKeys => throw _privateConstructorUsedError;

  /// Serializes this UploadKeysRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadKeysRequestCopyWith<UploadKeysRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadKeysRequestCopyWith<$Res> {
  factory $UploadKeysRequestCopyWith(
    UploadKeysRequest value,
    $Res Function(UploadKeysRequest) then,
  ) = _$UploadKeysRequestCopyWithImpl<$Res, UploadKeysRequest>;
  @useResult
  $Res call({SignedPreKey signedPreKey, List<OneTimePreKey> oneTimePreKeys});

  $SignedPreKeyCopyWith<$Res> get signedPreKey;
}

/// @nodoc
class _$UploadKeysRequestCopyWithImpl<$Res, $Val extends UploadKeysRequest>
    implements $UploadKeysRequestCopyWith<$Res> {
  _$UploadKeysRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signedPreKey = null, Object? oneTimePreKeys = null}) {
    return _then(
      _value.copyWith(
            signedPreKey: null == signedPreKey
                ? _value.signedPreKey
                : signedPreKey // ignore: cast_nullable_to_non_nullable
                      as SignedPreKey,
            oneTimePreKeys: null == oneTimePreKeys
                ? _value.oneTimePreKeys
                : oneTimePreKeys // ignore: cast_nullable_to_non_nullable
                      as List<OneTimePreKey>,
          )
          as $Val,
    );
  }

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedPreKeyCopyWith<$Res> get signedPreKey {
    return $SignedPreKeyCopyWith<$Res>(_value.signedPreKey, (value) {
      return _then(_value.copyWith(signedPreKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UploadKeysRequestImplCopyWith<$Res>
    implements $UploadKeysRequestCopyWith<$Res> {
  factory _$$UploadKeysRequestImplCopyWith(
    _$UploadKeysRequestImpl value,
    $Res Function(_$UploadKeysRequestImpl) then,
  ) = __$$UploadKeysRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignedPreKey signedPreKey, List<OneTimePreKey> oneTimePreKeys});

  @override
  $SignedPreKeyCopyWith<$Res> get signedPreKey;
}

/// @nodoc
class __$$UploadKeysRequestImplCopyWithImpl<$Res>
    extends _$UploadKeysRequestCopyWithImpl<$Res, _$UploadKeysRequestImpl>
    implements _$$UploadKeysRequestImplCopyWith<$Res> {
  __$$UploadKeysRequestImplCopyWithImpl(
    _$UploadKeysRequestImpl _value,
    $Res Function(_$UploadKeysRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signedPreKey = null, Object? oneTimePreKeys = null}) {
    return _then(
      _$UploadKeysRequestImpl(
        signedPreKey: null == signedPreKey
            ? _value.signedPreKey
            : signedPreKey // ignore: cast_nullable_to_non_nullable
                  as SignedPreKey,
        oneTimePreKeys: null == oneTimePreKeys
            ? _value._oneTimePreKeys
            : oneTimePreKeys // ignore: cast_nullable_to_non_nullable
                  as List<OneTimePreKey>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadKeysRequestImpl implements _UploadKeysRequest {
  const _$UploadKeysRequestImpl({
    required this.signedPreKey,
    required final List<OneTimePreKey> oneTimePreKeys,
  }) : _oneTimePreKeys = oneTimePreKeys;

  factory _$UploadKeysRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadKeysRequestImplFromJson(json);

  @override
  final SignedPreKey signedPreKey;
  final List<OneTimePreKey> _oneTimePreKeys;
  @override
  List<OneTimePreKey> get oneTimePreKeys {
    if (_oneTimePreKeys is EqualUnmodifiableListView) return _oneTimePreKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oneTimePreKeys);
  }

  @override
  String toString() {
    return 'UploadKeysRequest(signedPreKey: $signedPreKey, oneTimePreKeys: $oneTimePreKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadKeysRequestImpl &&
            (identical(other.signedPreKey, signedPreKey) ||
                other.signedPreKey == signedPreKey) &&
            const DeepCollectionEquality().equals(
              other._oneTimePreKeys,
              _oneTimePreKeys,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    signedPreKey,
    const DeepCollectionEquality().hash(_oneTimePreKeys),
  );

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadKeysRequestImplCopyWith<_$UploadKeysRequestImpl> get copyWith =>
      __$$UploadKeysRequestImplCopyWithImpl<_$UploadKeysRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadKeysRequestImplToJson(this);
  }
}

abstract class _UploadKeysRequest implements UploadKeysRequest {
  const factory _UploadKeysRequest({
    required final SignedPreKey signedPreKey,
    required final List<OneTimePreKey> oneTimePreKeys,
  }) = _$UploadKeysRequestImpl;

  factory _UploadKeysRequest.fromJson(Map<String, dynamic> json) =
      _$UploadKeysRequestImpl.fromJson;

  @override
  SignedPreKey get signedPreKey;
  @override
  List<OneTimePreKey> get oneTimePreKeys;

  /// Create a copy of UploadKeysRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadKeysRequestImplCopyWith<_$UploadKeysRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
