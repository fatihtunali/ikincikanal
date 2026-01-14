// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return _ApiError.fromJson(json);
}

/// @nodoc
mixin _$ApiError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this ApiError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
    _$ApiErrorImpl value,
    $Res Function(_$ApiErrorImpl) then,
  ) = __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
    _$ApiErrorImpl _value,
    $Res Function(_$ApiErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _$ApiErrorImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorImpl implements _ApiError {
  const _$ApiErrorImpl({
    required this.code,
    required this.message,
    final Map<String, dynamic>? details,
  }) : _details = details;

  factory _$ApiErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(_details),
  );

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorImplToJson(this);
  }
}

abstract class _ApiError implements ApiError {
  const factory _ApiError({
    required final String code,
    required final String message,
    final Map<String, dynamic>? details,
  }) = _$ApiErrorImpl;

  factory _ApiError.fromJson(Map<String, dynamic> json) =
      _$ApiErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<FieldError> get fields => throw _privateConstructorUsedError;

  /// Serializes this ValidationError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationErrorCopyWith<ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
    ValidationError value,
    $Res Function(ValidationError) then,
  ) = _$ValidationErrorCopyWithImpl<$Res, ValidationError>;
  @useResult
  $Res call({String code, String message, List<FieldError> fields});
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res, $Val extends ValidationError>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? fields = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<FieldError>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(
    _$ValidationErrorImpl value,
    $Res Function(_$ValidationErrorImpl) then,
  ) = __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, List<FieldError> fields});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
    _$ValidationErrorImpl _value,
    $Res Function(_$ValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? fields = null,
  }) {
    return _then(
      _$ValidationErrorImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<FieldError>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationErrorImpl implements _ValidationError {
  const _$ValidationErrorImpl({
    required this.code,
    required this.message,
    required final List<FieldError> fields,
  }) : _fields = fields;

  factory _$ValidationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  final List<FieldError> _fields;
  @override
  List<FieldError> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'ValidationError(code: $code, message: $message, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(_fields),
  );

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationErrorImplToJson(this);
  }
}

abstract class _ValidationError implements ValidationError {
  const factory _ValidationError({
    required final String code,
    required final String message,
    required final List<FieldError> fields,
  }) = _$ValidationErrorImpl;

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$ValidationErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  List<FieldError> get fields;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldError _$FieldErrorFromJson(Map<String, dynamic> json) {
  return _FieldError.fromJson(json);
}

/// @nodoc
mixin _$FieldError {
  String get path => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this FieldError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldErrorCopyWith<FieldError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldErrorCopyWith<$Res> {
  factory $FieldErrorCopyWith(
    FieldError value,
    $Res Function(FieldError) then,
  ) = _$FieldErrorCopyWithImpl<$Res, FieldError>;
  @useResult
  $Res call({String path, String message});
}

/// @nodoc
class _$FieldErrorCopyWithImpl<$Res, $Val extends FieldError>
    implements $FieldErrorCopyWith<$Res> {
  _$FieldErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? path = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FieldErrorImplCopyWith<$Res>
    implements $FieldErrorCopyWith<$Res> {
  factory _$$FieldErrorImplCopyWith(
    _$FieldErrorImpl value,
    $Res Function(_$FieldErrorImpl) then,
  ) = __$$FieldErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String message});
}

/// @nodoc
class __$$FieldErrorImplCopyWithImpl<$Res>
    extends _$FieldErrorCopyWithImpl<$Res, _$FieldErrorImpl>
    implements _$$FieldErrorImplCopyWith<$Res> {
  __$$FieldErrorImplCopyWithImpl(
    _$FieldErrorImpl _value,
    $Res Function(_$FieldErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? path = null, Object? message = null}) {
    return _then(
      _$FieldErrorImpl(
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldErrorImpl implements _FieldError {
  const _$FieldErrorImpl({required this.path, required this.message});

  factory _$FieldErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldErrorImplFromJson(json);

  @override
  final String path;
  @override
  final String message;

  @override
  String toString() {
    return 'FieldError(path: $path, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldErrorImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, message);

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldErrorImplCopyWith<_$FieldErrorImpl> get copyWith =>
      __$$FieldErrorImplCopyWithImpl<_$FieldErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldErrorImplToJson(this);
  }
}

abstract class _FieldError implements FieldError {
  const factory _FieldError({
    required final String path,
    required final String message,
  }) = _$FieldErrorImpl;

  factory _FieldError.fromJson(Map<String, dynamic> json) =
      _$FieldErrorImpl.fromJson;

  @override
  String get path;
  @override
  String get message;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldErrorImplCopyWith<_$FieldErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
