// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passkey_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PasskeyLoginOptions _$PasskeyLoginOptionsFromJson(Map<String, dynamic> json) {
  return _PasskeyLoginOptions.fromJson(json);
}

/// @nodoc
mixin _$PasskeyLoginOptions {
  String get challenge => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;
  String get rpId => throw _privateConstructorUsedError;
  List<AllowCredential> get allowCredentials =>
      throw _privateConstructorUsedError;
  String get userVerification => throw _privateConstructorUsedError;

  /// Serializes this PasskeyLoginOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyLoginOptionsCopyWith<PasskeyLoginOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyLoginOptionsCopyWith<$Res> {
  factory $PasskeyLoginOptionsCopyWith(
    PasskeyLoginOptions value,
    $Res Function(PasskeyLoginOptions) then,
  ) = _$PasskeyLoginOptionsCopyWithImpl<$Res, PasskeyLoginOptions>;
  @useResult
  $Res call({
    String challenge,
    int timeout,
    String rpId,
    List<AllowCredential> allowCredentials,
    String userVerification,
  });
}

/// @nodoc
class _$PasskeyLoginOptionsCopyWithImpl<$Res, $Val extends PasskeyLoginOptions>
    implements $PasskeyLoginOptionsCopyWith<$Res> {
  _$PasskeyLoginOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? timeout = null,
    Object? rpId = null,
    Object? allowCredentials = null,
    Object? userVerification = null,
  }) {
    return _then(
      _value.copyWith(
            challenge: null == challenge
                ? _value.challenge
                : challenge // ignore: cast_nullable_to_non_nullable
                      as String,
            timeout: null == timeout
                ? _value.timeout
                : timeout // ignore: cast_nullable_to_non_nullable
                      as int,
            rpId: null == rpId
                ? _value.rpId
                : rpId // ignore: cast_nullable_to_non_nullable
                      as String,
            allowCredentials: null == allowCredentials
                ? _value.allowCredentials
                : allowCredentials // ignore: cast_nullable_to_non_nullable
                      as List<AllowCredential>,
            userVerification: null == userVerification
                ? _value.userVerification
                : userVerification // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasskeyLoginOptionsImplCopyWith<$Res>
    implements $PasskeyLoginOptionsCopyWith<$Res> {
  factory _$$PasskeyLoginOptionsImplCopyWith(
    _$PasskeyLoginOptionsImpl value,
    $Res Function(_$PasskeyLoginOptionsImpl) then,
  ) = __$$PasskeyLoginOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String challenge,
    int timeout,
    String rpId,
    List<AllowCredential> allowCredentials,
    String userVerification,
  });
}

/// @nodoc
class __$$PasskeyLoginOptionsImplCopyWithImpl<$Res>
    extends _$PasskeyLoginOptionsCopyWithImpl<$Res, _$PasskeyLoginOptionsImpl>
    implements _$$PasskeyLoginOptionsImplCopyWith<$Res> {
  __$$PasskeyLoginOptionsImplCopyWithImpl(
    _$PasskeyLoginOptionsImpl _value,
    $Res Function(_$PasskeyLoginOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? timeout = null,
    Object? rpId = null,
    Object? allowCredentials = null,
    Object? userVerification = null,
  }) {
    return _then(
      _$PasskeyLoginOptionsImpl(
        challenge: null == challenge
            ? _value.challenge
            : challenge // ignore: cast_nullable_to_non_nullable
                  as String,
        timeout: null == timeout
            ? _value.timeout
            : timeout // ignore: cast_nullable_to_non_nullable
                  as int,
        rpId: null == rpId
            ? _value.rpId
            : rpId // ignore: cast_nullable_to_non_nullable
                  as String,
        allowCredentials: null == allowCredentials
            ? _value._allowCredentials
            : allowCredentials // ignore: cast_nullable_to_non_nullable
                  as List<AllowCredential>,
        userVerification: null == userVerification
            ? _value.userVerification
            : userVerification // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyLoginOptionsImpl implements _PasskeyLoginOptions {
  const _$PasskeyLoginOptionsImpl({
    required this.challenge,
    required this.timeout,
    required this.rpId,
    required final List<AllowCredential> allowCredentials,
    this.userVerification = 'preferred',
  }) : _allowCredentials = allowCredentials;

  factory _$PasskeyLoginOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasskeyLoginOptionsImplFromJson(json);

  @override
  final String challenge;
  @override
  final int timeout;
  @override
  final String rpId;
  final List<AllowCredential> _allowCredentials;
  @override
  List<AllowCredential> get allowCredentials {
    if (_allowCredentials is EqualUnmodifiableListView)
      return _allowCredentials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowCredentials);
  }

  @override
  @JsonKey()
  final String userVerification;

  @override
  String toString() {
    return 'PasskeyLoginOptions(challenge: $challenge, timeout: $timeout, rpId: $rpId, allowCredentials: $allowCredentials, userVerification: $userVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyLoginOptionsImpl &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.rpId, rpId) || other.rpId == rpId) &&
            const DeepCollectionEquality().equals(
              other._allowCredentials,
              _allowCredentials,
            ) &&
            (identical(other.userVerification, userVerification) ||
                other.userVerification == userVerification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    challenge,
    timeout,
    rpId,
    const DeepCollectionEquality().hash(_allowCredentials),
    userVerification,
  );

  /// Create a copy of PasskeyLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyLoginOptionsImplCopyWith<_$PasskeyLoginOptionsImpl> get copyWith =>
      __$$PasskeyLoginOptionsImplCopyWithImpl<_$PasskeyLoginOptionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyLoginOptionsImplToJson(this);
  }
}

abstract class _PasskeyLoginOptions implements PasskeyLoginOptions {
  const factory _PasskeyLoginOptions({
    required final String challenge,
    required final int timeout,
    required final String rpId,
    required final List<AllowCredential> allowCredentials,
    final String userVerification,
  }) = _$PasskeyLoginOptionsImpl;

  factory _PasskeyLoginOptions.fromJson(Map<String, dynamic> json) =
      _$PasskeyLoginOptionsImpl.fromJson;

  @override
  String get challenge;
  @override
  int get timeout;
  @override
  String get rpId;
  @override
  List<AllowCredential> get allowCredentials;
  @override
  String get userVerification;

  /// Create a copy of PasskeyLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyLoginOptionsImplCopyWith<_$PasskeyLoginOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllowCredential _$AllowCredentialFromJson(Map<String, dynamic> json) {
  return _AllowCredential.fromJson(json);
}

/// @nodoc
mixin _$AllowCredential {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String>? get transports => throw _privateConstructorUsedError;

  /// Serializes this AllowCredential to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllowCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllowCredentialCopyWith<AllowCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowCredentialCopyWith<$Res> {
  factory $AllowCredentialCopyWith(
    AllowCredential value,
    $Res Function(AllowCredential) then,
  ) = _$AllowCredentialCopyWithImpl<$Res, AllowCredential>;
  @useResult
  $Res call({String id, String type, List<String>? transports});
}

/// @nodoc
class _$AllowCredentialCopyWithImpl<$Res, $Val extends AllowCredential>
    implements $AllowCredentialCopyWith<$Res> {
  _$AllowCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllowCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? transports = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            transports: freezed == transports
                ? _value.transports
                : transports // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AllowCredentialImplCopyWith<$Res>
    implements $AllowCredentialCopyWith<$Res> {
  factory _$$AllowCredentialImplCopyWith(
    _$AllowCredentialImpl value,
    $Res Function(_$AllowCredentialImpl) then,
  ) = __$$AllowCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, List<String>? transports});
}

/// @nodoc
class __$$AllowCredentialImplCopyWithImpl<$Res>
    extends _$AllowCredentialCopyWithImpl<$Res, _$AllowCredentialImpl>
    implements _$$AllowCredentialImplCopyWith<$Res> {
  __$$AllowCredentialImplCopyWithImpl(
    _$AllowCredentialImpl _value,
    $Res Function(_$AllowCredentialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AllowCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? transports = freezed,
  }) {
    return _then(
      _$AllowCredentialImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        transports: freezed == transports
            ? _value._transports
            : transports // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AllowCredentialImpl implements _AllowCredential {
  const _$AllowCredentialImpl({
    required this.id,
    required this.type,
    final List<String>? transports,
  }) : _transports = transports;

  factory _$AllowCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllowCredentialImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  final List<String>? _transports;
  @override
  List<String>? get transports {
    final value = _transports;
    if (value == null) return null;
    if (_transports is EqualUnmodifiableListView) return _transports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllowCredential(id: $id, type: $type, transports: $transports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllowCredentialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._transports,
              _transports,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    const DeepCollectionEquality().hash(_transports),
  );

  /// Create a copy of AllowCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllowCredentialImplCopyWith<_$AllowCredentialImpl> get copyWith =>
      __$$AllowCredentialImplCopyWithImpl<_$AllowCredentialImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AllowCredentialImplToJson(this);
  }
}

abstract class _AllowCredential implements AllowCredential {
  const factory _AllowCredential({
    required final String id,
    required final String type,
    final List<String>? transports,
  }) = _$AllowCredentialImpl;

  factory _AllowCredential.fromJson(Map<String, dynamic> json) =
      _$AllowCredentialImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  List<String>? get transports;

  /// Create a copy of AllowCredential
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllowCredentialImplCopyWith<_$AllowCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasskeyRegistrationOptions _$PasskeyRegistrationOptionsFromJson(
  Map<String, dynamic> json,
) {
  return _PasskeyRegistrationOptions.fromJson(json);
}

/// @nodoc
mixin _$PasskeyRegistrationOptions {
  String get challenge => throw _privateConstructorUsedError;
  RelyingParty get rp => throw _privateConstructorUsedError;
  PasskeyUser get user => throw _privateConstructorUsedError;
  List<PubKeyCredParam> get pubKeyCredParams =>
      throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;
  AuthenticatorSelection? get authenticatorSelection =>
      throw _privateConstructorUsedError;
  String get attestation => throw _privateConstructorUsedError;

  /// Serializes this PasskeyRegistrationOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyRegistrationOptionsCopyWith<PasskeyRegistrationOptions>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyRegistrationOptionsCopyWith<$Res> {
  factory $PasskeyRegistrationOptionsCopyWith(
    PasskeyRegistrationOptions value,
    $Res Function(PasskeyRegistrationOptions) then,
  ) =
      _$PasskeyRegistrationOptionsCopyWithImpl<
        $Res,
        PasskeyRegistrationOptions
      >;
  @useResult
  $Res call({
    String challenge,
    RelyingParty rp,
    PasskeyUser user,
    List<PubKeyCredParam> pubKeyCredParams,
    int timeout,
    AuthenticatorSelection? authenticatorSelection,
    String attestation,
  });

  $RelyingPartyCopyWith<$Res> get rp;
  $PasskeyUserCopyWith<$Res> get user;
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;
}

/// @nodoc
class _$PasskeyRegistrationOptionsCopyWithImpl<
  $Res,
  $Val extends PasskeyRegistrationOptions
>
    implements $PasskeyRegistrationOptionsCopyWith<$Res> {
  _$PasskeyRegistrationOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? rp = null,
    Object? user = null,
    Object? pubKeyCredParams = null,
    Object? timeout = null,
    Object? authenticatorSelection = freezed,
    Object? attestation = null,
  }) {
    return _then(
      _value.copyWith(
            challenge: null == challenge
                ? _value.challenge
                : challenge // ignore: cast_nullable_to_non_nullable
                      as String,
            rp: null == rp
                ? _value.rp
                : rp // ignore: cast_nullable_to_non_nullable
                      as RelyingParty,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as PasskeyUser,
            pubKeyCredParams: null == pubKeyCredParams
                ? _value.pubKeyCredParams
                : pubKeyCredParams // ignore: cast_nullable_to_non_nullable
                      as List<PubKeyCredParam>,
            timeout: null == timeout
                ? _value.timeout
                : timeout // ignore: cast_nullable_to_non_nullable
                      as int,
            authenticatorSelection: freezed == authenticatorSelection
                ? _value.authenticatorSelection
                : authenticatorSelection // ignore: cast_nullable_to_non_nullable
                      as AuthenticatorSelection?,
            attestation: null == attestation
                ? _value.attestation
                : attestation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelyingPartyCopyWith<$Res> get rp {
    return $RelyingPartyCopyWith<$Res>(_value.rp, (value) {
      return _then(_value.copyWith(rp: value) as $Val);
    });
  }

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasskeyUserCopyWith<$Res> get user {
    return $PasskeyUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection {
    if (_value.authenticatorSelection == null) {
      return null;
    }

    return $AuthenticatorSelectionCopyWith<$Res>(
      _value.authenticatorSelection!,
      (value) {
        return _then(_value.copyWith(authenticatorSelection: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$PasskeyRegistrationOptionsImplCopyWith<$Res>
    implements $PasskeyRegistrationOptionsCopyWith<$Res> {
  factory _$$PasskeyRegistrationOptionsImplCopyWith(
    _$PasskeyRegistrationOptionsImpl value,
    $Res Function(_$PasskeyRegistrationOptionsImpl) then,
  ) = __$$PasskeyRegistrationOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String challenge,
    RelyingParty rp,
    PasskeyUser user,
    List<PubKeyCredParam> pubKeyCredParams,
    int timeout,
    AuthenticatorSelection? authenticatorSelection,
    String attestation,
  });

  @override
  $RelyingPartyCopyWith<$Res> get rp;
  @override
  $PasskeyUserCopyWith<$Res> get user;
  @override
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;
}

/// @nodoc
class __$$PasskeyRegistrationOptionsImplCopyWithImpl<$Res>
    extends
        _$PasskeyRegistrationOptionsCopyWithImpl<
          $Res,
          _$PasskeyRegistrationOptionsImpl
        >
    implements _$$PasskeyRegistrationOptionsImplCopyWith<$Res> {
  __$$PasskeyRegistrationOptionsImplCopyWithImpl(
    _$PasskeyRegistrationOptionsImpl _value,
    $Res Function(_$PasskeyRegistrationOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? rp = null,
    Object? user = null,
    Object? pubKeyCredParams = null,
    Object? timeout = null,
    Object? authenticatorSelection = freezed,
    Object? attestation = null,
  }) {
    return _then(
      _$PasskeyRegistrationOptionsImpl(
        challenge: null == challenge
            ? _value.challenge
            : challenge // ignore: cast_nullable_to_non_nullable
                  as String,
        rp: null == rp
            ? _value.rp
            : rp // ignore: cast_nullable_to_non_nullable
                  as RelyingParty,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as PasskeyUser,
        pubKeyCredParams: null == pubKeyCredParams
            ? _value._pubKeyCredParams
            : pubKeyCredParams // ignore: cast_nullable_to_non_nullable
                  as List<PubKeyCredParam>,
        timeout: null == timeout
            ? _value.timeout
            : timeout // ignore: cast_nullable_to_non_nullable
                  as int,
        authenticatorSelection: freezed == authenticatorSelection
            ? _value.authenticatorSelection
            : authenticatorSelection // ignore: cast_nullable_to_non_nullable
                  as AuthenticatorSelection?,
        attestation: null == attestation
            ? _value.attestation
            : attestation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyRegistrationOptionsImpl implements _PasskeyRegistrationOptions {
  const _$PasskeyRegistrationOptionsImpl({
    required this.challenge,
    required this.rp,
    required this.user,
    required final List<PubKeyCredParam> pubKeyCredParams,
    required this.timeout,
    this.authenticatorSelection,
    this.attestation = 'none',
  }) : _pubKeyCredParams = pubKeyCredParams;

  factory _$PasskeyRegistrationOptionsImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$PasskeyRegistrationOptionsImplFromJson(json);

  @override
  final String challenge;
  @override
  final RelyingParty rp;
  @override
  final PasskeyUser user;
  final List<PubKeyCredParam> _pubKeyCredParams;
  @override
  List<PubKeyCredParam> get pubKeyCredParams {
    if (_pubKeyCredParams is EqualUnmodifiableListView)
      return _pubKeyCredParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pubKeyCredParams);
  }

  @override
  final int timeout;
  @override
  final AuthenticatorSelection? authenticatorSelection;
  @override
  @JsonKey()
  final String attestation;

  @override
  String toString() {
    return 'PasskeyRegistrationOptions(challenge: $challenge, rp: $rp, user: $user, pubKeyCredParams: $pubKeyCredParams, timeout: $timeout, authenticatorSelection: $authenticatorSelection, attestation: $attestation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyRegistrationOptionsImpl &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.rp, rp) || other.rp == rp) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(
              other._pubKeyCredParams,
              _pubKeyCredParams,
            ) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.authenticatorSelection, authenticatorSelection) ||
                other.authenticatorSelection == authenticatorSelection) &&
            (identical(other.attestation, attestation) ||
                other.attestation == attestation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    challenge,
    rp,
    user,
    const DeepCollectionEquality().hash(_pubKeyCredParams),
    timeout,
    authenticatorSelection,
    attestation,
  );

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyRegistrationOptionsImplCopyWith<_$PasskeyRegistrationOptionsImpl>
  get copyWith =>
      __$$PasskeyRegistrationOptionsImplCopyWithImpl<
        _$PasskeyRegistrationOptionsImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyRegistrationOptionsImplToJson(this);
  }
}

abstract class _PasskeyRegistrationOptions
    implements PasskeyRegistrationOptions {
  const factory _PasskeyRegistrationOptions({
    required final String challenge,
    required final RelyingParty rp,
    required final PasskeyUser user,
    required final List<PubKeyCredParam> pubKeyCredParams,
    required final int timeout,
    final AuthenticatorSelection? authenticatorSelection,
    final String attestation,
  }) = _$PasskeyRegistrationOptionsImpl;

  factory _PasskeyRegistrationOptions.fromJson(Map<String, dynamic> json) =
      _$PasskeyRegistrationOptionsImpl.fromJson;

  @override
  String get challenge;
  @override
  RelyingParty get rp;
  @override
  PasskeyUser get user;
  @override
  List<PubKeyCredParam> get pubKeyCredParams;
  @override
  int get timeout;
  @override
  AuthenticatorSelection? get authenticatorSelection;
  @override
  String get attestation;

  /// Create a copy of PasskeyRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyRegistrationOptionsImplCopyWith<_$PasskeyRegistrationOptionsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RelyingParty _$RelyingPartyFromJson(Map<String, dynamic> json) {
  return _RelyingParty.fromJson(json);
}

/// @nodoc
mixin _$RelyingParty {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this RelyingParty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelyingParty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelyingPartyCopyWith<RelyingParty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelyingPartyCopyWith<$Res> {
  factory $RelyingPartyCopyWith(
    RelyingParty value,
    $Res Function(RelyingParty) then,
  ) = _$RelyingPartyCopyWithImpl<$Res, RelyingParty>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$RelyingPartyCopyWithImpl<$Res, $Val extends RelyingParty>
    implements $RelyingPartyCopyWith<$Res> {
  _$RelyingPartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelyingParty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelyingPartyImplCopyWith<$Res>
    implements $RelyingPartyCopyWith<$Res> {
  factory _$$RelyingPartyImplCopyWith(
    _$RelyingPartyImpl value,
    $Res Function(_$RelyingPartyImpl) then,
  ) = __$$RelyingPartyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$RelyingPartyImplCopyWithImpl<$Res>
    extends _$RelyingPartyCopyWithImpl<$Res, _$RelyingPartyImpl>
    implements _$$RelyingPartyImplCopyWith<$Res> {
  __$$RelyingPartyImplCopyWithImpl(
    _$RelyingPartyImpl _value,
    $Res Function(_$RelyingPartyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelyingParty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$RelyingPartyImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelyingPartyImpl implements _RelyingParty {
  const _$RelyingPartyImpl({required this.id, required this.name});

  factory _$RelyingPartyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelyingPartyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RelyingParty(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelyingPartyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of RelyingParty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelyingPartyImplCopyWith<_$RelyingPartyImpl> get copyWith =>
      __$$RelyingPartyImplCopyWithImpl<_$RelyingPartyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelyingPartyImplToJson(this);
  }
}

abstract class _RelyingParty implements RelyingParty {
  const factory _RelyingParty({
    required final String id,
    required final String name,
  }) = _$RelyingPartyImpl;

  factory _RelyingParty.fromJson(Map<String, dynamic> json) =
      _$RelyingPartyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of RelyingParty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelyingPartyImplCopyWith<_$RelyingPartyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasskeyUser _$PasskeyUserFromJson(Map<String, dynamic> json) {
  return _PasskeyUser.fromJson(json);
}

/// @nodoc
mixin _$PasskeyUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  /// Serializes this PasskeyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyUserCopyWith<PasskeyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyUserCopyWith<$Res> {
  factory $PasskeyUserCopyWith(
    PasskeyUser value,
    $Res Function(PasskeyUser) then,
  ) = _$PasskeyUserCopyWithImpl<$Res, PasskeyUser>;
  @useResult
  $Res call({String id, String name, String displayName});
}

/// @nodoc
class _$PasskeyUserCopyWithImpl<$Res, $Val extends PasskeyUser>
    implements $PasskeyUserCopyWith<$Res> {
  _$PasskeyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasskeyUserImplCopyWith<$Res>
    implements $PasskeyUserCopyWith<$Res> {
  factory _$$PasskeyUserImplCopyWith(
    _$PasskeyUserImpl value,
    $Res Function(_$PasskeyUserImpl) then,
  ) = __$$PasskeyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String displayName});
}

/// @nodoc
class __$$PasskeyUserImplCopyWithImpl<$Res>
    extends _$PasskeyUserCopyWithImpl<$Res, _$PasskeyUserImpl>
    implements _$$PasskeyUserImplCopyWith<$Res> {
  __$$PasskeyUserImplCopyWithImpl(
    _$PasskeyUserImpl _value,
    $Res Function(_$PasskeyUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(
      _$PasskeyUserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyUserImpl implements _PasskeyUser {
  const _$PasskeyUserImpl({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory _$PasskeyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasskeyUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;

  @override
  String toString() {
    return 'PasskeyUser(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  /// Create a copy of PasskeyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyUserImplCopyWith<_$PasskeyUserImpl> get copyWith =>
      __$$PasskeyUserImplCopyWithImpl<_$PasskeyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyUserImplToJson(this);
  }
}

abstract class _PasskeyUser implements PasskeyUser {
  const factory _PasskeyUser({
    required final String id,
    required final String name,
    required final String displayName,
  }) = _$PasskeyUserImpl;

  factory _PasskeyUser.fromJson(Map<String, dynamic> json) =
      _$PasskeyUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;

  /// Create a copy of PasskeyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyUserImplCopyWith<_$PasskeyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PubKeyCredParam _$PubKeyCredParamFromJson(Map<String, dynamic> json) {
  return _PubKeyCredParam.fromJson(json);
}

/// @nodoc
mixin _$PubKeyCredParam {
  String get type => throw _privateConstructorUsedError;
  int get alg => throw _privateConstructorUsedError;

  /// Serializes this PubKeyCredParam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PubKeyCredParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PubKeyCredParamCopyWith<PubKeyCredParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubKeyCredParamCopyWith<$Res> {
  factory $PubKeyCredParamCopyWith(
    PubKeyCredParam value,
    $Res Function(PubKeyCredParam) then,
  ) = _$PubKeyCredParamCopyWithImpl<$Res, PubKeyCredParam>;
  @useResult
  $Res call({String type, int alg});
}

/// @nodoc
class _$PubKeyCredParamCopyWithImpl<$Res, $Val extends PubKeyCredParam>
    implements $PubKeyCredParamCopyWith<$Res> {
  _$PubKeyCredParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PubKeyCredParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? alg = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            alg: null == alg
                ? _value.alg
                : alg // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PubKeyCredParamImplCopyWith<$Res>
    implements $PubKeyCredParamCopyWith<$Res> {
  factory _$$PubKeyCredParamImplCopyWith(
    _$PubKeyCredParamImpl value,
    $Res Function(_$PubKeyCredParamImpl) then,
  ) = __$$PubKeyCredParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int alg});
}

/// @nodoc
class __$$PubKeyCredParamImplCopyWithImpl<$Res>
    extends _$PubKeyCredParamCopyWithImpl<$Res, _$PubKeyCredParamImpl>
    implements _$$PubKeyCredParamImplCopyWith<$Res> {
  __$$PubKeyCredParamImplCopyWithImpl(
    _$PubKeyCredParamImpl _value,
    $Res Function(_$PubKeyCredParamImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PubKeyCredParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? alg = null}) {
    return _then(
      _$PubKeyCredParamImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        alg: null == alg
            ? _value.alg
            : alg // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PubKeyCredParamImpl implements _PubKeyCredParam {
  const _$PubKeyCredParamImpl({required this.type, required this.alg});

  factory _$PubKeyCredParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubKeyCredParamImplFromJson(json);

  @override
  final String type;
  @override
  final int alg;

  @override
  String toString() {
    return 'PubKeyCredParam(type: $type, alg: $alg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubKeyCredParamImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.alg, alg) || other.alg == alg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, alg);

  /// Create a copy of PubKeyCredParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PubKeyCredParamImplCopyWith<_$PubKeyCredParamImpl> get copyWith =>
      __$$PubKeyCredParamImplCopyWithImpl<_$PubKeyCredParamImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PubKeyCredParamImplToJson(this);
  }
}

abstract class _PubKeyCredParam implements PubKeyCredParam {
  const factory _PubKeyCredParam({
    required final String type,
    required final int alg,
  }) = _$PubKeyCredParamImpl;

  factory _PubKeyCredParam.fromJson(Map<String, dynamic> json) =
      _$PubKeyCredParamImpl.fromJson;

  @override
  String get type;
  @override
  int get alg;

  /// Create a copy of PubKeyCredParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PubKeyCredParamImplCopyWith<_$PubKeyCredParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthenticatorSelection _$AuthenticatorSelectionFromJson(
  Map<String, dynamic> json,
) {
  return _AuthenticatorSelection.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatorSelection {
  String? get authenticatorAttachment => throw _privateConstructorUsedError;
  String? get residentKey => throw _privateConstructorUsedError;
  String? get userVerification => throw _privateConstructorUsedError;

  /// Serializes this AuthenticatorSelection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticatorSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticatorSelectionCopyWith<AuthenticatorSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorSelectionCopyWith<$Res> {
  factory $AuthenticatorSelectionCopyWith(
    AuthenticatorSelection value,
    $Res Function(AuthenticatorSelection) then,
  ) = _$AuthenticatorSelectionCopyWithImpl<$Res, AuthenticatorSelection>;
  @useResult
  $Res call({
    String? authenticatorAttachment,
    String? residentKey,
    String? userVerification,
  });
}

/// @nodoc
class _$AuthenticatorSelectionCopyWithImpl<
  $Res,
  $Val extends AuthenticatorSelection
>
    implements $AuthenticatorSelectionCopyWith<$Res> {
  _$AuthenticatorSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticatorSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticatorAttachment = freezed,
    Object? residentKey = freezed,
    Object? userVerification = freezed,
  }) {
    return _then(
      _value.copyWith(
            authenticatorAttachment: freezed == authenticatorAttachment
                ? _value.authenticatorAttachment
                : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                      as String?,
            residentKey: freezed == residentKey
                ? _value.residentKey
                : residentKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            userVerification: freezed == userVerification
                ? _value.userVerification
                : userVerification // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthenticatorSelectionImplCopyWith<$Res>
    implements $AuthenticatorSelectionCopyWith<$Res> {
  factory _$$AuthenticatorSelectionImplCopyWith(
    _$AuthenticatorSelectionImpl value,
    $Res Function(_$AuthenticatorSelectionImpl) then,
  ) = __$$AuthenticatorSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? authenticatorAttachment,
    String? residentKey,
    String? userVerification,
  });
}

/// @nodoc
class __$$AuthenticatorSelectionImplCopyWithImpl<$Res>
    extends
        _$AuthenticatorSelectionCopyWithImpl<$Res, _$AuthenticatorSelectionImpl>
    implements _$$AuthenticatorSelectionImplCopyWith<$Res> {
  __$$AuthenticatorSelectionImplCopyWithImpl(
    _$AuthenticatorSelectionImpl _value,
    $Res Function(_$AuthenticatorSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthenticatorSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticatorAttachment = freezed,
    Object? residentKey = freezed,
    Object? userVerification = freezed,
  }) {
    return _then(
      _$AuthenticatorSelectionImpl(
        authenticatorAttachment: freezed == authenticatorAttachment
            ? _value.authenticatorAttachment
            : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                  as String?,
        residentKey: freezed == residentKey
            ? _value.residentKey
            : residentKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        userVerification: freezed == userVerification
            ? _value.userVerification
            : userVerification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticatorSelectionImpl implements _AuthenticatorSelection {
  const _$AuthenticatorSelectionImpl({
    this.authenticatorAttachment,
    this.residentKey,
    this.userVerification,
  });

  factory _$AuthenticatorSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticatorSelectionImplFromJson(json);

  @override
  final String? authenticatorAttachment;
  @override
  final String? residentKey;
  @override
  final String? userVerification;

  @override
  String toString() {
    return 'AuthenticatorSelection(authenticatorAttachment: $authenticatorAttachment, residentKey: $residentKey, userVerification: $userVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatorSelectionImpl &&
            (identical(
                  other.authenticatorAttachment,
                  authenticatorAttachment,
                ) ||
                other.authenticatorAttachment == authenticatorAttachment) &&
            (identical(other.residentKey, residentKey) ||
                other.residentKey == residentKey) &&
            (identical(other.userVerification, userVerification) ||
                other.userVerification == userVerification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    authenticatorAttachment,
    residentKey,
    userVerification,
  );

  /// Create a copy of AuthenticatorSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatorSelectionImplCopyWith<_$AuthenticatorSelectionImpl>
  get copyWith =>
      __$$AuthenticatorSelectionImplCopyWithImpl<_$AuthenticatorSelectionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticatorSelectionImplToJson(this);
  }
}

abstract class _AuthenticatorSelection implements AuthenticatorSelection {
  const factory _AuthenticatorSelection({
    final String? authenticatorAttachment,
    final String? residentKey,
    final String? userVerification,
  }) = _$AuthenticatorSelectionImpl;

  factory _AuthenticatorSelection.fromJson(Map<String, dynamic> json) =
      _$AuthenticatorSelectionImpl.fromJson;

  @override
  String? get authenticatorAttachment;
  @override
  String? get residentKey;
  @override
  String? get userVerification;

  /// Create a copy of AuthenticatorSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatorSelectionImplCopyWith<_$AuthenticatorSelectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
