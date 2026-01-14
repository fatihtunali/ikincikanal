// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  int get registrationId => throw _privateConstructorUsedError;
  String get identityKeyPub => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastActiveAt => throw _privateConstructorUsedError;
  DateTime? get revokedAt => throw _privateConstructorUsedError;

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call({
    String id,
    String userId,
    String deviceName,
    int registrationId,
    String identityKeyPub,
    DateTime createdAt,
    DateTime lastActiveAt,
    DateTime? revokedAt,
  });
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceName = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? revokedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceName: null == deviceName
                ? _value.deviceName
                : deviceName // ignore: cast_nullable_to_non_nullable
                      as String,
            registrationId: null == registrationId
                ? _value.registrationId
                : registrationId // ignore: cast_nullable_to_non_nullable
                      as int,
            identityKeyPub: null == identityKeyPub
                ? _value.identityKeyPub
                : identityKeyPub // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastActiveAt: null == lastActiveAt
                ? _value.lastActiveAt
                : lastActiveAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            revokedAt: freezed == revokedAt
                ? _value.revokedAt
                : revokedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
    _$DeviceImpl value,
    $Res Function(_$DeviceImpl) then,
  ) = __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String deviceName,
    int registrationId,
    String identityKeyPub,
    DateTime createdAt,
    DateTime lastActiveAt,
    DateTime? revokedAt,
  });
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
    _$DeviceImpl _value,
    $Res Function(_$DeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? deviceName = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? revokedAt = freezed,
  }) {
    return _then(
      _$DeviceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
        registrationId: null == registrationId
            ? _value.registrationId
            : registrationId // ignore: cast_nullable_to_non_nullable
                  as int,
        identityKeyPub: null == identityKeyPub
            ? _value.identityKeyPub
            : identityKeyPub // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastActiveAt: null == lastActiveAt
            ? _value.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        revokedAt: freezed == revokedAt
            ? _value.revokedAt
            : revokedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl implements _Device {
  const _$DeviceImpl({
    required this.id,
    required this.userId,
    required this.deviceName,
    required this.registrationId,
    required this.identityKeyPub,
    required this.createdAt,
    required this.lastActiveAt,
    this.revokedAt,
  });

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String deviceName;
  @override
  final int registrationId;
  @override
  final String identityKeyPub;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastActiveAt;
  @override
  final DateTime? revokedAt;

  @override
  String toString() {
    return 'Device(id: $id, userId: $userId, deviceName: $deviceName, registrationId: $registrationId, identityKeyPub: $identityKeyPub, createdAt: $createdAt, lastActiveAt: $lastActiveAt, revokedAt: $revokedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.identityKeyPub, identityKeyPub) ||
                other.identityKeyPub == identityKeyPub) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    deviceName,
    registrationId,
    identityKeyPub,
    createdAt,
    lastActiveAt,
    revokedAt,
  );

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(this);
  }
}

abstract class _Device implements Device {
  const factory _Device({
    required final String id,
    required final String userId,
    required final String deviceName,
    required final int registrationId,
    required final String identityKeyPub,
    required final DateTime createdAt,
    required final DateTime lastActiveAt,
    final DateTime? revokedAt,
  }) = _$DeviceImpl;

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get deviceName;
  @override
  int get registrationId;
  @override
  String get identityKeyPub;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastActiveAt;
  @override
  DateTime? get revokedAt;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceBootstrap _$DeviceBootstrapFromJson(Map<String, dynamic> json) {
  return _DeviceBootstrap.fromJson(json);
}

/// @nodoc
mixin _$DeviceBootstrap {
  String get deviceName => throw _privateConstructorUsedError;
  int get registrationId => throw _privateConstructorUsedError;
  String get identityKeyPub => throw _privateConstructorUsedError;

  /// Serializes this DeviceBootstrap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceBootstrap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceBootstrapCopyWith<DeviceBootstrap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceBootstrapCopyWith<$Res> {
  factory $DeviceBootstrapCopyWith(
    DeviceBootstrap value,
    $Res Function(DeviceBootstrap) then,
  ) = _$DeviceBootstrapCopyWithImpl<$Res, DeviceBootstrap>;
  @useResult
  $Res call({String deviceName, int registrationId, String identityKeyPub});
}

/// @nodoc
class _$DeviceBootstrapCopyWithImpl<$Res, $Val extends DeviceBootstrap>
    implements $DeviceBootstrapCopyWith<$Res> {
  _$DeviceBootstrapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceBootstrap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
  }) {
    return _then(
      _value.copyWith(
            deviceName: null == deviceName
                ? _value.deviceName
                : deviceName // ignore: cast_nullable_to_non_nullable
                      as String,
            registrationId: null == registrationId
                ? _value.registrationId
                : registrationId // ignore: cast_nullable_to_non_nullable
                      as int,
            identityKeyPub: null == identityKeyPub
                ? _value.identityKeyPub
                : identityKeyPub // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeviceBootstrapImplCopyWith<$Res>
    implements $DeviceBootstrapCopyWith<$Res> {
  factory _$$DeviceBootstrapImplCopyWith(
    _$DeviceBootstrapImpl value,
    $Res Function(_$DeviceBootstrapImpl) then,
  ) = __$$DeviceBootstrapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceName, int registrationId, String identityKeyPub});
}

/// @nodoc
class __$$DeviceBootstrapImplCopyWithImpl<$Res>
    extends _$DeviceBootstrapCopyWithImpl<$Res, _$DeviceBootstrapImpl>
    implements _$$DeviceBootstrapImplCopyWith<$Res> {
  __$$DeviceBootstrapImplCopyWithImpl(
    _$DeviceBootstrapImpl _value,
    $Res Function(_$DeviceBootstrapImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceBootstrap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? registrationId = null,
    Object? identityKeyPub = null,
  }) {
    return _then(
      _$DeviceBootstrapImpl(
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
        registrationId: null == registrationId
            ? _value.registrationId
            : registrationId // ignore: cast_nullable_to_non_nullable
                  as int,
        identityKeyPub: null == identityKeyPub
            ? _value.identityKeyPub
            : identityKeyPub // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceBootstrapImpl implements _DeviceBootstrap {
  const _$DeviceBootstrapImpl({
    required this.deviceName,
    required this.registrationId,
    required this.identityKeyPub,
  });

  factory _$DeviceBootstrapImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceBootstrapImplFromJson(json);

  @override
  final String deviceName;
  @override
  final int registrationId;
  @override
  final String identityKeyPub;

  @override
  String toString() {
    return 'DeviceBootstrap(deviceName: $deviceName, registrationId: $registrationId, identityKeyPub: $identityKeyPub)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceBootstrapImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.identityKeyPub, identityKeyPub) ||
                other.identityKeyPub == identityKeyPub));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceName, registrationId, identityKeyPub);

  /// Create a copy of DeviceBootstrap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceBootstrapImplCopyWith<_$DeviceBootstrapImpl> get copyWith =>
      __$$DeviceBootstrapImplCopyWithImpl<_$DeviceBootstrapImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceBootstrapImplToJson(this);
  }
}

abstract class _DeviceBootstrap implements DeviceBootstrap {
  const factory _DeviceBootstrap({
    required final String deviceName,
    required final int registrationId,
    required final String identityKeyPub,
  }) = _$DeviceBootstrapImpl;

  factory _DeviceBootstrap.fromJson(Map<String, dynamic> json) =
      _$DeviceBootstrapImpl.fromJson;

  @override
  String get deviceName;
  @override
  int get registrationId;
  @override
  String get identityKeyPub;

  /// Create a copy of DeviceBootstrap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceBootstrapImplCopyWith<_$DeviceBootstrapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddDeviceRequest _$AddDeviceRequestFromJson(Map<String, dynamic> json) {
  return _AddDeviceRequest.fromJson(json);
}

/// @nodoc
mixin _$AddDeviceRequest {
  DeviceBootstrap get device => throw _privateConstructorUsedError;
  InitialKeys get keys => throw _privateConstructorUsedError;

  /// Serializes this AddDeviceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDeviceRequestCopyWith<AddDeviceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceRequestCopyWith<$Res> {
  factory $AddDeviceRequestCopyWith(
    AddDeviceRequest value,
    $Res Function(AddDeviceRequest) then,
  ) = _$AddDeviceRequestCopyWithImpl<$Res, AddDeviceRequest>;
  @useResult
  $Res call({DeviceBootstrap device, InitialKeys keys});

  $DeviceBootstrapCopyWith<$Res> get device;
  $InitialKeysCopyWith<$Res> get keys;
}

/// @nodoc
class _$AddDeviceRequestCopyWithImpl<$Res, $Val extends AddDeviceRequest>
    implements $AddDeviceRequestCopyWith<$Res> {
  _$AddDeviceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null, Object? keys = null}) {
    return _then(
      _value.copyWith(
            device: null == device
                ? _value.device
                : device // ignore: cast_nullable_to_non_nullable
                      as DeviceBootstrap,
            keys: null == keys
                ? _value.keys
                : keys // ignore: cast_nullable_to_non_nullable
                      as InitialKeys,
          )
          as $Val,
    );
  }

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceBootstrapCopyWith<$Res> get device {
    return $DeviceBootstrapCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  /// Create a copy of AddDeviceRequest
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
abstract class _$$AddDeviceRequestImplCopyWith<$Res>
    implements $AddDeviceRequestCopyWith<$Res> {
  factory _$$AddDeviceRequestImplCopyWith(
    _$AddDeviceRequestImpl value,
    $Res Function(_$AddDeviceRequestImpl) then,
  ) = __$$AddDeviceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeviceBootstrap device, InitialKeys keys});

  @override
  $DeviceBootstrapCopyWith<$Res> get device;
  @override
  $InitialKeysCopyWith<$Res> get keys;
}

/// @nodoc
class __$$AddDeviceRequestImplCopyWithImpl<$Res>
    extends _$AddDeviceRequestCopyWithImpl<$Res, _$AddDeviceRequestImpl>
    implements _$$AddDeviceRequestImplCopyWith<$Res> {
  __$$AddDeviceRequestImplCopyWithImpl(
    _$AddDeviceRequestImpl _value,
    $Res Function(_$AddDeviceRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null, Object? keys = null}) {
    return _then(
      _$AddDeviceRequestImpl(
        device: null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                  as DeviceBootstrap,
        keys: null == keys
            ? _value.keys
            : keys // ignore: cast_nullable_to_non_nullable
                  as InitialKeys,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDeviceRequestImpl implements _AddDeviceRequest {
  const _$AddDeviceRequestImpl({required this.device, required this.keys});

  factory _$AddDeviceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDeviceRequestImplFromJson(json);

  @override
  final DeviceBootstrap device;
  @override
  final InitialKeys keys;

  @override
  String toString() {
    return 'AddDeviceRequest(device: $device, keys: $keys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDeviceRequestImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.keys, keys) || other.keys == keys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device, keys);

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDeviceRequestImplCopyWith<_$AddDeviceRequestImpl> get copyWith =>
      __$$AddDeviceRequestImplCopyWithImpl<_$AddDeviceRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDeviceRequestImplToJson(this);
  }
}

abstract class _AddDeviceRequest implements AddDeviceRequest {
  const factory _AddDeviceRequest({
    required final DeviceBootstrap device,
    required final InitialKeys keys,
  }) = _$AddDeviceRequestImpl;

  factory _AddDeviceRequest.fromJson(Map<String, dynamic> json) =
      _$AddDeviceRequestImpl.fromJson;

  @override
  DeviceBootstrap get device;
  @override
  InitialKeys get keys;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDeviceRequestImplCopyWith<_$AddDeviceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
