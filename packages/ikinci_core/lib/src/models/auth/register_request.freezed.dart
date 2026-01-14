// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  String get handle => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  PasskeyAttestation? get passkey => throw _privateConstructorUsedError;
  DeviceBootstrap get device => throw _privateConstructorUsedError;
  InitialKeys get keys => throw _privateConstructorUsedError;
  String get acceptedPrivacyVersion => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
    RegisterRequest value,
    $Res Function(RegisterRequest) then,
  ) = _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call({
    String handle,
    String? password,
    PasskeyAttestation? passkey,
    DeviceBootstrap device,
    InitialKeys keys,
    String acceptedPrivacyVersion,
  });

  $PasskeyAttestationCopyWith<$Res>? get passkey;
  $DeviceBootstrapCopyWith<$Res> get device;
  $InitialKeysCopyWith<$Res> get keys;
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
    Object? password = freezed,
    Object? passkey = freezed,
    Object? device = null,
    Object? keys = null,
    Object? acceptedPrivacyVersion = null,
  }) {
    return _then(
      _value.copyWith(
            handle: null == handle
                ? _value.handle
                : handle // ignore: cast_nullable_to_non_nullable
                      as String,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            passkey: freezed == passkey
                ? _value.passkey
                : passkey // ignore: cast_nullable_to_non_nullable
                      as PasskeyAttestation?,
            device: null == device
                ? _value.device
                : device // ignore: cast_nullable_to_non_nullable
                      as DeviceBootstrap,
            keys: null == keys
                ? _value.keys
                : keys // ignore: cast_nullable_to_non_nullable
                      as InitialKeys,
            acceptedPrivacyVersion: null == acceptedPrivacyVersion
                ? _value.acceptedPrivacyVersion
                : acceptedPrivacyVersion // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasskeyAttestationCopyWith<$Res>? get passkey {
    if (_value.passkey == null) {
      return null;
    }

    return $PasskeyAttestationCopyWith<$Res>(_value.passkey!, (value) {
      return _then(_value.copyWith(passkey: value) as $Val);
    });
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceBootstrapCopyWith<$Res> get device {
    return $DeviceBootstrapCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitialKeysCopyWith<$Res> get keys {
    return $InitialKeysCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(
    _$RegisterRequestImpl value,
    $Res Function(_$RegisterRequestImpl) then,
  ) = __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String handle,
    String? password,
    PasskeyAttestation? passkey,
    DeviceBootstrap device,
    InitialKeys keys,
    String acceptedPrivacyVersion,
  });

  @override
  $PasskeyAttestationCopyWith<$Res>? get passkey;
  @override
  $DeviceBootstrapCopyWith<$Res> get device;
  @override
  $InitialKeysCopyWith<$Res> get keys;
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
    _$RegisterRequestImpl _value,
    $Res Function(_$RegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
    Object? password = freezed,
    Object? passkey = freezed,
    Object? device = null,
    Object? keys = null,
    Object? acceptedPrivacyVersion = null,
  }) {
    return _then(
      _$RegisterRequestImpl(
        handle: null == handle
            ? _value.handle
            : handle // ignore: cast_nullable_to_non_nullable
                  as String,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        passkey: freezed == passkey
            ? _value.passkey
            : passkey // ignore: cast_nullable_to_non_nullable
                  as PasskeyAttestation?,
        device: null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                  as DeviceBootstrap,
        keys: null == keys
            ? _value.keys
            : keys // ignore: cast_nullable_to_non_nullable
                  as InitialKeys,
        acceptedPrivacyVersion: null == acceptedPrivacyVersion
            ? _value.acceptedPrivacyVersion
            : acceptedPrivacyVersion // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl({
    required this.handle,
    this.password,
    this.passkey,
    required this.device,
    required this.keys,
    required this.acceptedPrivacyVersion,
  });

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final String handle;
  @override
  final String? password;
  @override
  final PasskeyAttestation? passkey;
  @override
  final DeviceBootstrap device;
  @override
  final InitialKeys keys;
  @override
  final String acceptedPrivacyVersion;

  @override
  String toString() {
    return 'RegisterRequest(handle: $handle, password: $password, passkey: $passkey, device: $device, keys: $keys, acceptedPrivacyVersion: $acceptedPrivacyVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passkey, passkey) || other.passkey == passkey) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.keys, keys) || other.keys == keys) &&
            (identical(other.acceptedPrivacyVersion, acceptedPrivacyVersion) ||
                other.acceptedPrivacyVersion == acceptedPrivacyVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    handle,
    password,
    passkey,
    device,
    keys,
    acceptedPrivacyVersion,
  );

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(this);
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest({
    required final String handle,
    final String? password,
    final PasskeyAttestation? passkey,
    required final DeviceBootstrap device,
    required final InitialKeys keys,
    required final String acceptedPrivacyVersion,
  }) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  String get handle;
  @override
  String? get password;
  @override
  PasskeyAttestation? get passkey;
  @override
  DeviceBootstrap get device;
  @override
  InitialKeys get keys;
  @override
  String get acceptedPrivacyVersion;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasswordLoginRequest _$PasswordLoginRequestFromJson(Map<String, dynamic> json) {
  return _PasswordLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$PasswordLoginRequest {
  String get handle => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  DeviceBootstrap? get newDevice => throw _privateConstructorUsedError;
  InitialKeys? get newDeviceKeys => throw _privateConstructorUsedError;

  /// Serializes this PasswordLoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordLoginRequestCopyWith<PasswordLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordLoginRequestCopyWith<$Res> {
  factory $PasswordLoginRequestCopyWith(
    PasswordLoginRequest value,
    $Res Function(PasswordLoginRequest) then,
  ) = _$PasswordLoginRequestCopyWithImpl<$Res, PasswordLoginRequest>;
  @useResult
  $Res call({
    String handle,
    String password,
    String? deviceId,
    DeviceBootstrap? newDevice,
    InitialKeys? newDeviceKeys,
  });

  $DeviceBootstrapCopyWith<$Res>? get newDevice;
  $InitialKeysCopyWith<$Res>? get newDeviceKeys;
}

/// @nodoc
class _$PasswordLoginRequestCopyWithImpl<
  $Res,
  $Val extends PasswordLoginRequest
>
    implements $PasswordLoginRequestCopyWith<$Res> {
  _$PasswordLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
    Object? password = null,
    Object? deviceId = freezed,
    Object? newDevice = freezed,
    Object? newDeviceKeys = freezed,
  }) {
    return _then(
      _value.copyWith(
            handle: null == handle
                ? _value.handle
                : handle // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            newDevice: freezed == newDevice
                ? _value.newDevice
                : newDevice // ignore: cast_nullable_to_non_nullable
                      as DeviceBootstrap?,
            newDeviceKeys: freezed == newDeviceKeys
                ? _value.newDeviceKeys
                : newDeviceKeys // ignore: cast_nullable_to_non_nullable
                      as InitialKeys?,
          )
          as $Val,
    );
  }

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceBootstrapCopyWith<$Res>? get newDevice {
    if (_value.newDevice == null) {
      return null;
    }

    return $DeviceBootstrapCopyWith<$Res>(_value.newDevice!, (value) {
      return _then(_value.copyWith(newDevice: value) as $Val);
    });
  }

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitialKeysCopyWith<$Res>? get newDeviceKeys {
    if (_value.newDeviceKeys == null) {
      return null;
    }

    return $InitialKeysCopyWith<$Res>(_value.newDeviceKeys!, (value) {
      return _then(_value.copyWith(newDeviceKeys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PasswordLoginRequestImplCopyWith<$Res>
    implements $PasswordLoginRequestCopyWith<$Res> {
  factory _$$PasswordLoginRequestImplCopyWith(
    _$PasswordLoginRequestImpl value,
    $Res Function(_$PasswordLoginRequestImpl) then,
  ) = __$$PasswordLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String handle,
    String password,
    String? deviceId,
    DeviceBootstrap? newDevice,
    InitialKeys? newDeviceKeys,
  });

  @override
  $DeviceBootstrapCopyWith<$Res>? get newDevice;
  @override
  $InitialKeysCopyWith<$Res>? get newDeviceKeys;
}

/// @nodoc
class __$$PasswordLoginRequestImplCopyWithImpl<$Res>
    extends _$PasswordLoginRequestCopyWithImpl<$Res, _$PasswordLoginRequestImpl>
    implements _$$PasswordLoginRequestImplCopyWith<$Res> {
  __$$PasswordLoginRequestImplCopyWithImpl(
    _$PasswordLoginRequestImpl _value,
    $Res Function(_$PasswordLoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
    Object? password = null,
    Object? deviceId = freezed,
    Object? newDevice = freezed,
    Object? newDeviceKeys = freezed,
  }) {
    return _then(
      _$PasswordLoginRequestImpl(
        handle: null == handle
            ? _value.handle
            : handle // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        newDevice: freezed == newDevice
            ? _value.newDevice
            : newDevice // ignore: cast_nullable_to_non_nullable
                  as DeviceBootstrap?,
        newDeviceKeys: freezed == newDeviceKeys
            ? _value.newDeviceKeys
            : newDeviceKeys // ignore: cast_nullable_to_non_nullable
                  as InitialKeys?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordLoginRequestImpl implements _PasswordLoginRequest {
  const _$PasswordLoginRequestImpl({
    required this.handle,
    required this.password,
    this.deviceId,
    this.newDevice,
    this.newDeviceKeys,
  });

  factory _$PasswordLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordLoginRequestImplFromJson(json);

  @override
  final String handle;
  @override
  final String password;
  @override
  final String? deviceId;
  @override
  final DeviceBootstrap? newDevice;
  @override
  final InitialKeys? newDeviceKeys;

  @override
  String toString() {
    return 'PasswordLoginRequest(handle: $handle, password: $password, deviceId: $deviceId, newDevice: $newDevice, newDeviceKeys: $newDeviceKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordLoginRequestImpl &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.newDevice, newDevice) ||
                other.newDevice == newDevice) &&
            (identical(other.newDeviceKeys, newDeviceKeys) ||
                other.newDeviceKeys == newDeviceKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    handle,
    password,
    deviceId,
    newDevice,
    newDeviceKeys,
  );

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordLoginRequestImplCopyWith<_$PasswordLoginRequestImpl>
  get copyWith =>
      __$$PasswordLoginRequestImplCopyWithImpl<_$PasswordLoginRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordLoginRequestImplToJson(this);
  }
}

abstract class _PasswordLoginRequest implements PasswordLoginRequest {
  const factory _PasswordLoginRequest({
    required final String handle,
    required final String password,
    final String? deviceId,
    final DeviceBootstrap? newDevice,
    final InitialKeys? newDeviceKeys,
  }) = _$PasswordLoginRequestImpl;

  factory _PasswordLoginRequest.fromJson(Map<String, dynamic> json) =
      _$PasswordLoginRequestImpl.fromJson;

  @override
  String get handle;
  @override
  String get password;
  @override
  String? get deviceId;
  @override
  DeviceBootstrap? get newDevice;
  @override
  InitialKeys? get newDeviceKeys;

  /// Create a copy of PasswordLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordLoginRequestImplCopyWith<_$PasswordLoginRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
