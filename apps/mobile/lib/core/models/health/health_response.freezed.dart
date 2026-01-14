// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthResponse _$HealthResponseFromJson(Map<String, dynamic> json) {
  return _HealthResponse.fromJson(json);
}

/// @nodoc
mixin _$HealthResponse {
  bool get ok => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  FederationStatus get federation => throw _privateConstructorUsedError;

  /// Serializes this HealthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthResponseCopyWith<HealthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthResponseCopyWith<$Res> {
  factory $HealthResponseCopyWith(
    HealthResponse value,
    $Res Function(HealthResponse) then,
  ) = _$HealthResponseCopyWithImpl<$Res, HealthResponse>;
  @useResult
  $Res call({
    bool ok,
    String service,
    String version,
    DateTime time,
    FederationStatus federation,
  });

  $FederationStatusCopyWith<$Res> get federation;
}

/// @nodoc
class _$HealthResponseCopyWithImpl<$Res, $Val extends HealthResponse>
    implements $HealthResponseCopyWith<$Res> {
  _$HealthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? service = null,
    Object? version = null,
    Object? time = null,
    Object? federation = null,
  }) {
    return _then(
      _value.copyWith(
            ok: null == ok
                ? _value.ok
                : ok // ignore: cast_nullable_to_non_nullable
                      as bool,
            service: null == service
                ? _value.service
                : service // ignore: cast_nullable_to_non_nullable
                      as String,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            federation: null == federation
                ? _value.federation
                : federation // ignore: cast_nullable_to_non_nullable
                      as FederationStatus,
          )
          as $Val,
    );
  }

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FederationStatusCopyWith<$Res> get federation {
    return $FederationStatusCopyWith<$Res>(_value.federation, (value) {
      return _then(_value.copyWith(federation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HealthResponseImplCopyWith<$Res>
    implements $HealthResponseCopyWith<$Res> {
  factory _$$HealthResponseImplCopyWith(
    _$HealthResponseImpl value,
    $Res Function(_$HealthResponseImpl) then,
  ) = __$$HealthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool ok,
    String service,
    String version,
    DateTime time,
    FederationStatus federation,
  });

  @override
  $FederationStatusCopyWith<$Res> get federation;
}

/// @nodoc
class __$$HealthResponseImplCopyWithImpl<$Res>
    extends _$HealthResponseCopyWithImpl<$Res, _$HealthResponseImpl>
    implements _$$HealthResponseImplCopyWith<$Res> {
  __$$HealthResponseImplCopyWithImpl(
    _$HealthResponseImpl _value,
    $Res Function(_$HealthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? service = null,
    Object? version = null,
    Object? time = null,
    Object? federation = null,
  }) {
    return _then(
      _$HealthResponseImpl(
        ok: null == ok
            ? _value.ok
            : ok // ignore: cast_nullable_to_non_nullable
                  as bool,
        service: null == service
            ? _value.service
            : service // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        federation: null == federation
            ? _value.federation
            : federation // ignore: cast_nullable_to_non_nullable
                  as FederationStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthResponseImpl implements _HealthResponse {
  const _$HealthResponseImpl({
    required this.ok,
    required this.service,
    required this.version,
    required this.time,
    required this.federation,
  });

  factory _$HealthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthResponseImplFromJson(json);

  @override
  final bool ok;
  @override
  final String service;
  @override
  final String version;
  @override
  final DateTime time;
  @override
  final FederationStatus federation;

  @override
  String toString() {
    return 'HealthResponse(ok: $ok, service: $service, version: $version, time: $time, federation: $federation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthResponseImpl &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.federation, federation) ||
                other.federation == federation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ok, service, version, time, federation);

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthResponseImplCopyWith<_$HealthResponseImpl> get copyWith =>
      __$$HealthResponseImplCopyWithImpl<_$HealthResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthResponseImplToJson(this);
  }
}

abstract class _HealthResponse implements HealthResponse {
  const factory _HealthResponse({
    required final bool ok,
    required final String service,
    required final String version,
    required final DateTime time,
    required final FederationStatus federation,
  }) = _$HealthResponseImpl;

  factory _HealthResponse.fromJson(Map<String, dynamic> json) =
      _$HealthResponseImpl.fromJson;

  @override
  bool get ok;
  @override
  String get service;
  @override
  String get version;
  @override
  DateTime get time;
  @override
  FederationStatus get federation;

  /// Create a copy of HealthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthResponseImplCopyWith<_$HealthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FederationStatus _$FederationStatusFromJson(Map<String, dynamic> json) {
  return _FederationStatus.fromJson(json);
}

/// @nodoc
mixin _$FederationStatus {
  bool get enabled => throw _privateConstructorUsedError;
  String get serverHandle => throw _privateConstructorUsedError;
  int get connectedServers => throw _privateConstructorUsedError;

  /// Serializes this FederationStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FederationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FederationStatusCopyWith<FederationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FederationStatusCopyWith<$Res> {
  factory $FederationStatusCopyWith(
    FederationStatus value,
    $Res Function(FederationStatus) then,
  ) = _$FederationStatusCopyWithImpl<$Res, FederationStatus>;
  @useResult
  $Res call({bool enabled, String serverHandle, int connectedServers});
}

/// @nodoc
class _$FederationStatusCopyWithImpl<$Res, $Val extends FederationStatus>
    implements $FederationStatusCopyWith<$Res> {
  _$FederationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FederationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? serverHandle = null,
    Object? connectedServers = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            serverHandle: null == serverHandle
                ? _value.serverHandle
                : serverHandle // ignore: cast_nullable_to_non_nullable
                      as String,
            connectedServers: null == connectedServers
                ? _value.connectedServers
                : connectedServers // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FederationStatusImplCopyWith<$Res>
    implements $FederationStatusCopyWith<$Res> {
  factory _$$FederationStatusImplCopyWith(
    _$FederationStatusImpl value,
    $Res Function(_$FederationStatusImpl) then,
  ) = __$$FederationStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, String serverHandle, int connectedServers});
}

/// @nodoc
class __$$FederationStatusImplCopyWithImpl<$Res>
    extends _$FederationStatusCopyWithImpl<$Res, _$FederationStatusImpl>
    implements _$$FederationStatusImplCopyWith<$Res> {
  __$$FederationStatusImplCopyWithImpl(
    _$FederationStatusImpl _value,
    $Res Function(_$FederationStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FederationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? serverHandle = null,
    Object? connectedServers = null,
  }) {
    return _then(
      _$FederationStatusImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        serverHandle: null == serverHandle
            ? _value.serverHandle
            : serverHandle // ignore: cast_nullable_to_non_nullable
                  as String,
        connectedServers: null == connectedServers
            ? _value.connectedServers
            : connectedServers // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FederationStatusImpl implements _FederationStatus {
  const _$FederationStatusImpl({
    required this.enabled,
    required this.serverHandle,
    required this.connectedServers,
  });

  factory _$FederationStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$FederationStatusImplFromJson(json);

  @override
  final bool enabled;
  @override
  final String serverHandle;
  @override
  final int connectedServers;

  @override
  String toString() {
    return 'FederationStatus(enabled: $enabled, serverHandle: $serverHandle, connectedServers: $connectedServers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FederationStatusImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.serverHandle, serverHandle) ||
                other.serverHandle == serverHandle) &&
            (identical(other.connectedServers, connectedServers) ||
                other.connectedServers == connectedServers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enabled, serverHandle, connectedServers);

  /// Create a copy of FederationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FederationStatusImplCopyWith<_$FederationStatusImpl> get copyWith =>
      __$$FederationStatusImplCopyWithImpl<_$FederationStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FederationStatusImplToJson(this);
  }
}

abstract class _FederationStatus implements FederationStatus {
  const factory _FederationStatus({
    required final bool enabled,
    required final String serverHandle,
    required final int connectedServers,
  }) = _$FederationStatusImpl;

  factory _FederationStatus.fromJson(Map<String, dynamic> json) =
      _$FederationStatusImpl.fromJson;

  @override
  bool get enabled;
  @override
  String get serverHandle;
  @override
  int get connectedServers;

  /// Create a copy of FederationStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FederationStatusImplCopyWith<_$FederationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
