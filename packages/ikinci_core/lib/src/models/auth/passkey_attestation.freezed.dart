// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passkey_attestation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PasskeyAttestation _$PasskeyAttestationFromJson(Map<String, dynamic> json) {
  return _PasskeyAttestation.fromJson(json);
}

/// @nodoc
mixin _$PasskeyAttestation {
  String get id => throw _privateConstructorUsedError;
  String get rawId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  PasskeyAttestationResponse get response => throw _privateConstructorUsedError;
  String? get authenticatorAttachment => throw _privateConstructorUsedError;

  /// Serializes this PasskeyAttestation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyAttestationCopyWith<PasskeyAttestation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyAttestationCopyWith<$Res> {
  factory $PasskeyAttestationCopyWith(
    PasskeyAttestation value,
    $Res Function(PasskeyAttestation) then,
  ) = _$PasskeyAttestationCopyWithImpl<$Res, PasskeyAttestation>;
  @useResult
  $Res call({
    String id,
    String rawId,
    String type,
    PasskeyAttestationResponse response,
    String? authenticatorAttachment,
  });

  $PasskeyAttestationResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$PasskeyAttestationCopyWithImpl<$Res, $Val extends PasskeyAttestation>
    implements $PasskeyAttestationCopyWith<$Res> {
  _$PasskeyAttestationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? type = null,
    Object? response = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            rawId: null == rawId
                ? _value.rawId
                : rawId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            response: null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                      as PasskeyAttestationResponse,
            authenticatorAttachment: freezed == authenticatorAttachment
                ? _value.authenticatorAttachment
                : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasskeyAttestationResponseCopyWith<$Res> get response {
    return $PasskeyAttestationResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PasskeyAttestationImplCopyWith<$Res>
    implements $PasskeyAttestationCopyWith<$Res> {
  factory _$$PasskeyAttestationImplCopyWith(
    _$PasskeyAttestationImpl value,
    $Res Function(_$PasskeyAttestationImpl) then,
  ) = __$$PasskeyAttestationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String rawId,
    String type,
    PasskeyAttestationResponse response,
    String? authenticatorAttachment,
  });

  @override
  $PasskeyAttestationResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$PasskeyAttestationImplCopyWithImpl<$Res>
    extends _$PasskeyAttestationCopyWithImpl<$Res, _$PasskeyAttestationImpl>
    implements _$$PasskeyAttestationImplCopyWith<$Res> {
  __$$PasskeyAttestationImplCopyWithImpl(
    _$PasskeyAttestationImpl _value,
    $Res Function(_$PasskeyAttestationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? type = null,
    Object? response = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(
      _$PasskeyAttestationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        rawId: null == rawId
            ? _value.rawId
            : rawId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        response: null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PasskeyAttestationResponse,
        authenticatorAttachment: freezed == authenticatorAttachment
            ? _value.authenticatorAttachment
            : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyAttestationImpl implements _PasskeyAttestation {
  const _$PasskeyAttestationImpl({
    required this.id,
    required this.rawId,
    required this.type,
    required this.response,
    this.authenticatorAttachment,
  });

  factory _$PasskeyAttestationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasskeyAttestationImplFromJson(json);

  @override
  final String id;
  @override
  final String rawId;
  @override
  final String type;
  @override
  final PasskeyAttestationResponse response;
  @override
  final String? authenticatorAttachment;

  @override
  String toString() {
    return 'PasskeyAttestation(id: $id, rawId: $rawId, type: $type, response: $response, authenticatorAttachment: $authenticatorAttachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyAttestationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rawId, rawId) || other.rawId == rawId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(
                  other.authenticatorAttachment,
                  authenticatorAttachment,
                ) ||
                other.authenticatorAttachment == authenticatorAttachment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rawId,
    type,
    response,
    authenticatorAttachment,
  );

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyAttestationImplCopyWith<_$PasskeyAttestationImpl> get copyWith =>
      __$$PasskeyAttestationImplCopyWithImpl<_$PasskeyAttestationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyAttestationImplToJson(this);
  }
}

abstract class _PasskeyAttestation implements PasskeyAttestation {
  const factory _PasskeyAttestation({
    required final String id,
    required final String rawId,
    required final String type,
    required final PasskeyAttestationResponse response,
    final String? authenticatorAttachment,
  }) = _$PasskeyAttestationImpl;

  factory _PasskeyAttestation.fromJson(Map<String, dynamic> json) =
      _$PasskeyAttestationImpl.fromJson;

  @override
  String get id;
  @override
  String get rawId;
  @override
  String get type;
  @override
  PasskeyAttestationResponse get response;
  @override
  String? get authenticatorAttachment;

  /// Create a copy of PasskeyAttestation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyAttestationImplCopyWith<_$PasskeyAttestationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasskeyAttestationResponse _$PasskeyAttestationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PasskeyAttestationResponse.fromJson(json);
}

/// @nodoc
mixin _$PasskeyAttestationResponse {
  String get clientDataJSON => throw _privateConstructorUsedError;
  String get attestationObject => throw _privateConstructorUsedError;
  List<String>? get transports => throw _privateConstructorUsedError;

  /// Serializes this PasskeyAttestationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyAttestationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyAttestationResponseCopyWith<PasskeyAttestationResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyAttestationResponseCopyWith<$Res> {
  factory $PasskeyAttestationResponseCopyWith(
    PasskeyAttestationResponse value,
    $Res Function(PasskeyAttestationResponse) then,
  ) =
      _$PasskeyAttestationResponseCopyWithImpl<
        $Res,
        PasskeyAttestationResponse
      >;
  @useResult
  $Res call({
    String clientDataJSON,
    String attestationObject,
    List<String>? transports,
  });
}

/// @nodoc
class _$PasskeyAttestationResponseCopyWithImpl<
  $Res,
  $Val extends PasskeyAttestationResponse
>
    implements $PasskeyAttestationResponseCopyWith<$Res> {
  _$PasskeyAttestationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyAttestationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? attestationObject = null,
    Object? transports = freezed,
  }) {
    return _then(
      _value.copyWith(
            clientDataJSON: null == clientDataJSON
                ? _value.clientDataJSON
                : clientDataJSON // ignore: cast_nullable_to_non_nullable
                      as String,
            attestationObject: null == attestationObject
                ? _value.attestationObject
                : attestationObject // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PasskeyAttestationResponseImplCopyWith<$Res>
    implements $PasskeyAttestationResponseCopyWith<$Res> {
  factory _$$PasskeyAttestationResponseImplCopyWith(
    _$PasskeyAttestationResponseImpl value,
    $Res Function(_$PasskeyAttestationResponseImpl) then,
  ) = __$$PasskeyAttestationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String clientDataJSON,
    String attestationObject,
    List<String>? transports,
  });
}

/// @nodoc
class __$$PasskeyAttestationResponseImplCopyWithImpl<$Res>
    extends
        _$PasskeyAttestationResponseCopyWithImpl<
          $Res,
          _$PasskeyAttestationResponseImpl
        >
    implements _$$PasskeyAttestationResponseImplCopyWith<$Res> {
  __$$PasskeyAttestationResponseImplCopyWithImpl(
    _$PasskeyAttestationResponseImpl _value,
    $Res Function(_$PasskeyAttestationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyAttestationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? attestationObject = null,
    Object? transports = freezed,
  }) {
    return _then(
      _$PasskeyAttestationResponseImpl(
        clientDataJSON: null == clientDataJSON
            ? _value.clientDataJSON
            : clientDataJSON // ignore: cast_nullable_to_non_nullable
                  as String,
        attestationObject: null == attestationObject
            ? _value.attestationObject
            : attestationObject // ignore: cast_nullable_to_non_nullable
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
class _$PasskeyAttestationResponseImpl implements _PasskeyAttestationResponse {
  const _$PasskeyAttestationResponseImpl({
    required this.clientDataJSON,
    required this.attestationObject,
    final List<String>? transports,
  }) : _transports = transports;

  factory _$PasskeyAttestationResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$PasskeyAttestationResponseImplFromJson(json);

  @override
  final String clientDataJSON;
  @override
  final String attestationObject;
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
    return 'PasskeyAttestationResponse(clientDataJSON: $clientDataJSON, attestationObject: $attestationObject, transports: $transports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyAttestationResponseImpl &&
            (identical(other.clientDataJSON, clientDataJSON) ||
                other.clientDataJSON == clientDataJSON) &&
            (identical(other.attestationObject, attestationObject) ||
                other.attestationObject == attestationObject) &&
            const DeepCollectionEquality().equals(
              other._transports,
              _transports,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clientDataJSON,
    attestationObject,
    const DeepCollectionEquality().hash(_transports),
  );

  /// Create a copy of PasskeyAttestationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyAttestationResponseImplCopyWith<_$PasskeyAttestationResponseImpl>
  get copyWith =>
      __$$PasskeyAttestationResponseImplCopyWithImpl<
        _$PasskeyAttestationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyAttestationResponseImplToJson(this);
  }
}

abstract class _PasskeyAttestationResponse
    implements PasskeyAttestationResponse {
  const factory _PasskeyAttestationResponse({
    required final String clientDataJSON,
    required final String attestationObject,
    final List<String>? transports,
  }) = _$PasskeyAttestationResponseImpl;

  factory _PasskeyAttestationResponse.fromJson(Map<String, dynamic> json) =
      _$PasskeyAttestationResponseImpl.fromJson;

  @override
  String get clientDataJSON;
  @override
  String get attestationObject;
  @override
  List<String>? get transports;

  /// Create a copy of PasskeyAttestationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyAttestationResponseImplCopyWith<_$PasskeyAttestationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PasskeyAssertion _$PasskeyAssertionFromJson(Map<String, dynamic> json) {
  return _PasskeyAssertion.fromJson(json);
}

/// @nodoc
mixin _$PasskeyAssertion {
  String get id => throw _privateConstructorUsedError;
  String get rawId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  PasskeyAssertionResponse get response => throw _privateConstructorUsedError;
  String? get authenticatorAttachment => throw _privateConstructorUsedError;

  /// Serializes this PasskeyAssertion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyAssertionCopyWith<PasskeyAssertion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyAssertionCopyWith<$Res> {
  factory $PasskeyAssertionCopyWith(
    PasskeyAssertion value,
    $Res Function(PasskeyAssertion) then,
  ) = _$PasskeyAssertionCopyWithImpl<$Res, PasskeyAssertion>;
  @useResult
  $Res call({
    String id,
    String rawId,
    String type,
    PasskeyAssertionResponse response,
    String? authenticatorAttachment,
  });

  $PasskeyAssertionResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$PasskeyAssertionCopyWithImpl<$Res, $Val extends PasskeyAssertion>
    implements $PasskeyAssertionCopyWith<$Res> {
  _$PasskeyAssertionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? type = null,
    Object? response = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            rawId: null == rawId
                ? _value.rawId
                : rawId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            response: null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                      as PasskeyAssertionResponse,
            authenticatorAttachment: freezed == authenticatorAttachment
                ? _value.authenticatorAttachment
                : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasskeyAssertionResponseCopyWith<$Res> get response {
    return $PasskeyAssertionResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PasskeyAssertionImplCopyWith<$Res>
    implements $PasskeyAssertionCopyWith<$Res> {
  factory _$$PasskeyAssertionImplCopyWith(
    _$PasskeyAssertionImpl value,
    $Res Function(_$PasskeyAssertionImpl) then,
  ) = __$$PasskeyAssertionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String rawId,
    String type,
    PasskeyAssertionResponse response,
    String? authenticatorAttachment,
  });

  @override
  $PasskeyAssertionResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$PasskeyAssertionImplCopyWithImpl<$Res>
    extends _$PasskeyAssertionCopyWithImpl<$Res, _$PasskeyAssertionImpl>
    implements _$$PasskeyAssertionImplCopyWith<$Res> {
  __$$PasskeyAssertionImplCopyWithImpl(
    _$PasskeyAssertionImpl _value,
    $Res Function(_$PasskeyAssertionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? type = null,
    Object? response = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(
      _$PasskeyAssertionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        rawId: null == rawId
            ? _value.rawId
            : rawId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        response: null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PasskeyAssertionResponse,
        authenticatorAttachment: freezed == authenticatorAttachment
            ? _value.authenticatorAttachment
            : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyAssertionImpl implements _PasskeyAssertion {
  const _$PasskeyAssertionImpl({
    required this.id,
    required this.rawId,
    required this.type,
    required this.response,
    this.authenticatorAttachment,
  });

  factory _$PasskeyAssertionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasskeyAssertionImplFromJson(json);

  @override
  final String id;
  @override
  final String rawId;
  @override
  final String type;
  @override
  final PasskeyAssertionResponse response;
  @override
  final String? authenticatorAttachment;

  @override
  String toString() {
    return 'PasskeyAssertion(id: $id, rawId: $rawId, type: $type, response: $response, authenticatorAttachment: $authenticatorAttachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyAssertionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rawId, rawId) || other.rawId == rawId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(
                  other.authenticatorAttachment,
                  authenticatorAttachment,
                ) ||
                other.authenticatorAttachment == authenticatorAttachment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rawId,
    type,
    response,
    authenticatorAttachment,
  );

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyAssertionImplCopyWith<_$PasskeyAssertionImpl> get copyWith =>
      __$$PasskeyAssertionImplCopyWithImpl<_$PasskeyAssertionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyAssertionImplToJson(this);
  }
}

abstract class _PasskeyAssertion implements PasskeyAssertion {
  const factory _PasskeyAssertion({
    required final String id,
    required final String rawId,
    required final String type,
    required final PasskeyAssertionResponse response,
    final String? authenticatorAttachment,
  }) = _$PasskeyAssertionImpl;

  factory _PasskeyAssertion.fromJson(Map<String, dynamic> json) =
      _$PasskeyAssertionImpl.fromJson;

  @override
  String get id;
  @override
  String get rawId;
  @override
  String get type;
  @override
  PasskeyAssertionResponse get response;
  @override
  String? get authenticatorAttachment;

  /// Create a copy of PasskeyAssertion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyAssertionImplCopyWith<_$PasskeyAssertionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasskeyAssertionResponse _$PasskeyAssertionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PasskeyAssertionResponse.fromJson(json);
}

/// @nodoc
mixin _$PasskeyAssertionResponse {
  String get clientDataJSON => throw _privateConstructorUsedError;
  String get authenticatorData => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  String? get userHandle => throw _privateConstructorUsedError;

  /// Serializes this PasskeyAssertionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasskeyAssertionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasskeyAssertionResponseCopyWith<PasskeyAssertionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasskeyAssertionResponseCopyWith<$Res> {
  factory $PasskeyAssertionResponseCopyWith(
    PasskeyAssertionResponse value,
    $Res Function(PasskeyAssertionResponse) then,
  ) = _$PasskeyAssertionResponseCopyWithImpl<$Res, PasskeyAssertionResponse>;
  @useResult
  $Res call({
    String clientDataJSON,
    String authenticatorData,
    String signature,
    String? userHandle,
  });
}

/// @nodoc
class _$PasskeyAssertionResponseCopyWithImpl<
  $Res,
  $Val extends PasskeyAssertionResponse
>
    implements $PasskeyAssertionResponseCopyWith<$Res> {
  _$PasskeyAssertionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasskeyAssertionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? authenticatorData = null,
    Object? signature = null,
    Object? userHandle = freezed,
  }) {
    return _then(
      _value.copyWith(
            clientDataJSON: null == clientDataJSON
                ? _value.clientDataJSON
                : clientDataJSON // ignore: cast_nullable_to_non_nullable
                      as String,
            authenticatorData: null == authenticatorData
                ? _value.authenticatorData
                : authenticatorData // ignore: cast_nullable_to_non_nullable
                      as String,
            signature: null == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String,
            userHandle: freezed == userHandle
                ? _value.userHandle
                : userHandle // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasskeyAssertionResponseImplCopyWith<$Res>
    implements $PasskeyAssertionResponseCopyWith<$Res> {
  factory _$$PasskeyAssertionResponseImplCopyWith(
    _$PasskeyAssertionResponseImpl value,
    $Res Function(_$PasskeyAssertionResponseImpl) then,
  ) = __$$PasskeyAssertionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String clientDataJSON,
    String authenticatorData,
    String signature,
    String? userHandle,
  });
}

/// @nodoc
class __$$PasskeyAssertionResponseImplCopyWithImpl<$Res>
    extends
        _$PasskeyAssertionResponseCopyWithImpl<
          $Res,
          _$PasskeyAssertionResponseImpl
        >
    implements _$$PasskeyAssertionResponseImplCopyWith<$Res> {
  __$$PasskeyAssertionResponseImplCopyWithImpl(
    _$PasskeyAssertionResponseImpl _value,
    $Res Function(_$PasskeyAssertionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasskeyAssertionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? authenticatorData = null,
    Object? signature = null,
    Object? userHandle = freezed,
  }) {
    return _then(
      _$PasskeyAssertionResponseImpl(
        clientDataJSON: null == clientDataJSON
            ? _value.clientDataJSON
            : clientDataJSON // ignore: cast_nullable_to_non_nullable
                  as String,
        authenticatorData: null == authenticatorData
            ? _value.authenticatorData
            : authenticatorData // ignore: cast_nullable_to_non_nullable
                  as String,
        signature: null == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String,
        userHandle: freezed == userHandle
            ? _value.userHandle
            : userHandle // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasskeyAssertionResponseImpl implements _PasskeyAssertionResponse {
  const _$PasskeyAssertionResponseImpl({
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    this.userHandle,
  });

  factory _$PasskeyAssertionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasskeyAssertionResponseImplFromJson(json);

  @override
  final String clientDataJSON;
  @override
  final String authenticatorData;
  @override
  final String signature;
  @override
  final String? userHandle;

  @override
  String toString() {
    return 'PasskeyAssertionResponse(clientDataJSON: $clientDataJSON, authenticatorData: $authenticatorData, signature: $signature, userHandle: $userHandle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasskeyAssertionResponseImpl &&
            (identical(other.clientDataJSON, clientDataJSON) ||
                other.clientDataJSON == clientDataJSON) &&
            (identical(other.authenticatorData, authenticatorData) ||
                other.authenticatorData == authenticatorData) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.userHandle, userHandle) ||
                other.userHandle == userHandle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    clientDataJSON,
    authenticatorData,
    signature,
    userHandle,
  );

  /// Create a copy of PasskeyAssertionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasskeyAssertionResponseImplCopyWith<_$PasskeyAssertionResponseImpl>
  get copyWith =>
      __$$PasskeyAssertionResponseImplCopyWithImpl<
        _$PasskeyAssertionResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasskeyAssertionResponseImplToJson(this);
  }
}

abstract class _PasskeyAssertionResponse implements PasskeyAssertionResponse {
  const factory _PasskeyAssertionResponse({
    required final String clientDataJSON,
    required final String authenticatorData,
    required final String signature,
    final String? userHandle,
  }) = _$PasskeyAssertionResponseImpl;

  factory _PasskeyAssertionResponse.fromJson(Map<String, dynamic> json) =
      _$PasskeyAssertionResponseImpl.fromJson;

  @override
  String get clientDataJSON;
  @override
  String get authenticatorData;
  @override
  String get signature;
  @override
  String? get userHandle;

  /// Create a copy of PasskeyAssertionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasskeyAssertionResponseImplCopyWith<_$PasskeyAssertionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
