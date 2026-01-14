// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_export.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DataExport _$DataExportFromJson(Map<String, dynamic> json) {
  return _DataExport.fromJson(json);
}

/// @nodoc
mixin _$DataExport {
  DateTime get exportedAt => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<Device> get devices => throw _privateConstructorUsedError;
  int get messageCount => throw _privateConstructorUsedError;

  /// Serializes this DataExport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataExportCopyWith<DataExport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataExportCopyWith<$Res> {
  factory $DataExportCopyWith(
    DataExport value,
    $Res Function(DataExport) then,
  ) = _$DataExportCopyWithImpl<$Res, DataExport>;
  @useResult
  $Res call({
    DateTime exportedAt,
    User user,
    List<Device> devices,
    int messageCount,
  });

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$DataExportCopyWithImpl<$Res, $Val extends DataExport>
    implements $DataExportCopyWith<$Res> {
  _$DataExportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exportedAt = null,
    Object? user = null,
    Object? devices = null,
    Object? messageCount = null,
  }) {
    return _then(
      _value.copyWith(
            exportedAt: null == exportedAt
                ? _value.exportedAt
                : exportedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User,
            devices: null == devices
                ? _value.devices
                : devices // ignore: cast_nullable_to_non_nullable
                      as List<Device>,
            messageCount: null == messageCount
                ? _value.messageCount
                : messageCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataExportImplCopyWith<$Res>
    implements $DataExportCopyWith<$Res> {
  factory _$$DataExportImplCopyWith(
    _$DataExportImpl value,
    $Res Function(_$DataExportImpl) then,
  ) = __$$DataExportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime exportedAt,
    User user,
    List<Device> devices,
    int messageCount,
  });

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$DataExportImplCopyWithImpl<$Res>
    extends _$DataExportCopyWithImpl<$Res, _$DataExportImpl>
    implements _$$DataExportImplCopyWith<$Res> {
  __$$DataExportImplCopyWithImpl(
    _$DataExportImpl _value,
    $Res Function(_$DataExportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exportedAt = null,
    Object? user = null,
    Object? devices = null,
    Object? messageCount = null,
  }) {
    return _then(
      _$DataExportImpl(
        exportedAt: null == exportedAt
            ? _value.exportedAt
            : exportedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User,
        devices: null == devices
            ? _value._devices
            : devices // ignore: cast_nullable_to_non_nullable
                  as List<Device>,
        messageCount: null == messageCount
            ? _value.messageCount
            : messageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataExportImpl implements _DataExport {
  const _$DataExportImpl({
    required this.exportedAt,
    required this.user,
    required final List<Device> devices,
    required this.messageCount,
  }) : _devices = devices;

  factory _$DataExportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataExportImplFromJson(json);

  @override
  final DateTime exportedAt;
  @override
  final User user;
  final List<Device> _devices;
  @override
  List<Device> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final int messageCount;

  @override
  String toString() {
    return 'DataExport(exportedAt: $exportedAt, user: $user, devices: $devices, messageCount: $messageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataExportImpl &&
            (identical(other.exportedAt, exportedAt) ||
                other.exportedAt == exportedAt) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exportedAt,
    user,
    const DeepCollectionEquality().hash(_devices),
    messageCount,
  );

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataExportImplCopyWith<_$DataExportImpl> get copyWith =>
      __$$DataExportImplCopyWithImpl<_$DataExportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataExportImplToJson(this);
  }
}

abstract class _DataExport implements DataExport {
  const factory _DataExport({
    required final DateTime exportedAt,
    required final User user,
    required final List<Device> devices,
    required final int messageCount,
  }) = _$DataExportImpl;

  factory _DataExport.fromJson(Map<String, dynamic> json) =
      _$DataExportImpl.fromJson;

  @override
  DateTime get exportedAt;
  @override
  User get user;
  @override
  List<Device> get devices;
  @override
  int get messageCount;

  /// Create a copy of DataExport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataExportImplCopyWith<_$DataExportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
