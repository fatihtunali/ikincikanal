// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get fullHandle => throw _privateConstructorUsedError;
  String get homeServer => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  UserSettings? get settings => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String id,
    String handle,
    String fullHandle,
    String homeServer,
    String? displayName,
    DateTime createdAt,
    String status,
    UserSettings? settings,
  });

  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? fullHandle = null,
    Object? homeServer = null,
    Object? displayName = freezed,
    Object? createdAt = null,
    Object? status = null,
    Object? settings = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            handle: null == handle
                ? _value.handle
                : handle // ignore: cast_nullable_to_non_nullable
                      as String,
            fullHandle: null == fullHandle
                ? _value.fullHandle
                : fullHandle // ignore: cast_nullable_to_non_nullable
                      as String,
            homeServer: null == homeServer
                ? _value.homeServer
                : homeServer // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            settings: freezed == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as UserSettings?,
          )
          as $Val,
    );
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $UserSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String handle,
    String fullHandle,
    String homeServer,
    String? displayName,
    DateTime createdAt,
    String status,
    UserSettings? settings,
  });

  @override
  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? fullHandle = null,
    Object? homeServer = null,
    Object? displayName = freezed,
    Object? createdAt = null,
    Object? status = null,
    Object? settings = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        handle: null == handle
            ? _value.handle
            : handle // ignore: cast_nullable_to_non_nullable
                  as String,
        fullHandle: null == fullHandle
            ? _value.fullHandle
            : fullHandle // ignore: cast_nullable_to_non_nullable
                  as String,
        homeServer: null == homeServer
            ? _value.homeServer
            : homeServer // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        settings: freezed == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as UserSettings?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    required this.handle,
    required this.fullHandle,
    required this.homeServer,
    this.displayName,
    required this.createdAt,
    this.status = 'active',
    this.settings,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String handle;
  @override
  final String fullHandle;
  @override
  final String homeServer;
  @override
  final String? displayName;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String status;
  @override
  final UserSettings? settings;

  @override
  String toString() {
    return 'User(id: $id, handle: $handle, fullHandle: $fullHandle, homeServer: $homeServer, displayName: $displayName, createdAt: $createdAt, status: $status, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.fullHandle, fullHandle) ||
                other.fullHandle == fullHandle) &&
            (identical(other.homeServer, homeServer) ||
                other.homeServer == homeServer) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    handle,
    fullHandle,
    homeServer,
    displayName,
    createdAt,
    status,
    settings,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String id,
    required final String handle,
    required final String fullHandle,
    required final String homeServer,
    final String? displayName,
    required final DateTime createdAt,
    final String status,
    final UserSettings? settings,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get handle;
  @override
  String get fullHandle;
  @override
  String get homeServer;
  @override
  String? get displayName;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override
  UserSettings? get settings;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  int? get defaultDisappearingSeconds => throw _privateConstructorUsedError;
  bool get allowSealedSender => throw _privateConstructorUsedError;
  bool get readReceipts => throw _privateConstructorUsedError;
  bool get typingIndicators => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
    UserSettings value,
    $Res Function(UserSettings) then,
  ) = _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call({
    int? defaultDisappearingSeconds,
    bool allowSealedSender,
    bool readReceipts,
    bool typingIndicators,
  });
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultDisappearingSeconds = freezed,
    Object? allowSealedSender = null,
    Object? readReceipts = null,
    Object? typingIndicators = null,
  }) {
    return _then(
      _value.copyWith(
            defaultDisappearingSeconds: freezed == defaultDisappearingSeconds
                ? _value.defaultDisappearingSeconds
                : defaultDisappearingSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            allowSealedSender: null == allowSealedSender
                ? _value.allowSealedSender
                : allowSealedSender // ignore: cast_nullable_to_non_nullable
                      as bool,
            readReceipts: null == readReceipts
                ? _value.readReceipts
                : readReceipts // ignore: cast_nullable_to_non_nullable
                      as bool,
            typingIndicators: null == typingIndicators
                ? _value.typingIndicators
                : typingIndicators // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
    _$UserSettingsImpl value,
    $Res Function(_$UserSettingsImpl) then,
  ) = __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? defaultDisappearingSeconds,
    bool allowSealedSender,
    bool readReceipts,
    bool typingIndicators,
  });
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
    _$UserSettingsImpl _value,
    $Res Function(_$UserSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultDisappearingSeconds = freezed,
    Object? allowSealedSender = null,
    Object? readReceipts = null,
    Object? typingIndicators = null,
  }) {
    return _then(
      _$UserSettingsImpl(
        defaultDisappearingSeconds: freezed == defaultDisappearingSeconds
            ? _value.defaultDisappearingSeconds
            : defaultDisappearingSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        allowSealedSender: null == allowSealedSender
            ? _value.allowSealedSender
            : allowSealedSender // ignore: cast_nullable_to_non_nullable
                  as bool,
        readReceipts: null == readReceipts
            ? _value.readReceipts
            : readReceipts // ignore: cast_nullable_to_non_nullable
                  as bool,
        typingIndicators: null == typingIndicators
            ? _value.typingIndicators
            : typingIndicators // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl({
    this.defaultDisappearingSeconds,
    this.allowSealedSender = true,
    this.readReceipts = false,
    this.typingIndicators = false,
  });

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final int? defaultDisappearingSeconds;
  @override
  @JsonKey()
  final bool allowSealedSender;
  @override
  @JsonKey()
  final bool readReceipts;
  @override
  @JsonKey()
  final bool typingIndicators;

  @override
  String toString() {
    return 'UserSettings(defaultDisappearingSeconds: $defaultDisappearingSeconds, allowSealedSender: $allowSealedSender, readReceipts: $readReceipts, typingIndicators: $typingIndicators)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(
                  other.defaultDisappearingSeconds,
                  defaultDisappearingSeconds,
                ) ||
                other.defaultDisappearingSeconds ==
                    defaultDisappearingSeconds) &&
            (identical(other.allowSealedSender, allowSealedSender) ||
                other.allowSealedSender == allowSealedSender) &&
            (identical(other.readReceipts, readReceipts) ||
                other.readReceipts == readReceipts) &&
            (identical(other.typingIndicators, typingIndicators) ||
                other.typingIndicators == typingIndicators));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultDisappearingSeconds,
    allowSealedSender,
    readReceipts,
    typingIndicators,
  );

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(this);
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings({
    final int? defaultDisappearingSeconds,
    final bool allowSealedSender,
    final bool readReceipts,
    final bool typingIndicators,
  }) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  int? get defaultDisappearingSeconds;
  @override
  bool get allowSealedSender;
  @override
  bool get readReceipts;
  @override
  bool get typingIndicators;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResolveResponse _$UserResolveResponseFromJson(Map<String, dynamic> json) {
  return _UserResolveResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResolveResponse {
  String get id => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get fullHandle => throw _privateConstructorUsedError;
  String get homeServer => throw _privateConstructorUsedError;
  bool get hasDevice => throw _privateConstructorUsedError;
  bool get isFederated => throw _privateConstructorUsedError;

  /// Serializes this UserResolveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResolveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResolveResponseCopyWith<UserResolveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResolveResponseCopyWith<$Res> {
  factory $UserResolveResponseCopyWith(
    UserResolveResponse value,
    $Res Function(UserResolveResponse) then,
  ) = _$UserResolveResponseCopyWithImpl<$Res, UserResolveResponse>;
  @useResult
  $Res call({
    String id,
    String handle,
    String fullHandle,
    String homeServer,
    bool hasDevice,
    bool isFederated,
  });
}

/// @nodoc
class _$UserResolveResponseCopyWithImpl<$Res, $Val extends UserResolveResponse>
    implements $UserResolveResponseCopyWith<$Res> {
  _$UserResolveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResolveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? fullHandle = null,
    Object? homeServer = null,
    Object? hasDevice = null,
    Object? isFederated = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            handle: null == handle
                ? _value.handle
                : handle // ignore: cast_nullable_to_non_nullable
                      as String,
            fullHandle: null == fullHandle
                ? _value.fullHandle
                : fullHandle // ignore: cast_nullable_to_non_nullable
                      as String,
            homeServer: null == homeServer
                ? _value.homeServer
                : homeServer // ignore: cast_nullable_to_non_nullable
                      as String,
            hasDevice: null == hasDevice
                ? _value.hasDevice
                : hasDevice // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFederated: null == isFederated
                ? _value.isFederated
                : isFederated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserResolveResponseImplCopyWith<$Res>
    implements $UserResolveResponseCopyWith<$Res> {
  factory _$$UserResolveResponseImplCopyWith(
    _$UserResolveResponseImpl value,
    $Res Function(_$UserResolveResponseImpl) then,
  ) = __$$UserResolveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String handle,
    String fullHandle,
    String homeServer,
    bool hasDevice,
    bool isFederated,
  });
}

/// @nodoc
class __$$UserResolveResponseImplCopyWithImpl<$Res>
    extends _$UserResolveResponseCopyWithImpl<$Res, _$UserResolveResponseImpl>
    implements _$$UserResolveResponseImplCopyWith<$Res> {
  __$$UserResolveResponseImplCopyWithImpl(
    _$UserResolveResponseImpl _value,
    $Res Function(_$UserResolveResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserResolveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? fullHandle = null,
    Object? homeServer = null,
    Object? hasDevice = null,
    Object? isFederated = null,
  }) {
    return _then(
      _$UserResolveResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        handle: null == handle
            ? _value.handle
            : handle // ignore: cast_nullable_to_non_nullable
                  as String,
        fullHandle: null == fullHandle
            ? _value.fullHandle
            : fullHandle // ignore: cast_nullable_to_non_nullable
                  as String,
        homeServer: null == homeServer
            ? _value.homeServer
            : homeServer // ignore: cast_nullable_to_non_nullable
                  as String,
        hasDevice: null == hasDevice
            ? _value.hasDevice
            : hasDevice // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFederated: null == isFederated
            ? _value.isFederated
            : isFederated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResolveResponseImpl implements _UserResolveResponse {
  const _$UserResolveResponseImpl({
    required this.id,
    required this.handle,
    required this.fullHandle,
    required this.homeServer,
    required this.hasDevice,
    required this.isFederated,
  });

  factory _$UserResolveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResolveResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String handle;
  @override
  final String fullHandle;
  @override
  final String homeServer;
  @override
  final bool hasDevice;
  @override
  final bool isFederated;

  @override
  String toString() {
    return 'UserResolveResponse(id: $id, handle: $handle, fullHandle: $fullHandle, homeServer: $homeServer, hasDevice: $hasDevice, isFederated: $isFederated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResolveResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.fullHandle, fullHandle) ||
                other.fullHandle == fullHandle) &&
            (identical(other.homeServer, homeServer) ||
                other.homeServer == homeServer) &&
            (identical(other.hasDevice, hasDevice) ||
                other.hasDevice == hasDevice) &&
            (identical(other.isFederated, isFederated) ||
                other.isFederated == isFederated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    handle,
    fullHandle,
    homeServer,
    hasDevice,
    isFederated,
  );

  /// Create a copy of UserResolveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResolveResponseImplCopyWith<_$UserResolveResponseImpl> get copyWith =>
      __$$UserResolveResponseImplCopyWithImpl<_$UserResolveResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResolveResponseImplToJson(this);
  }
}

abstract class _UserResolveResponse implements UserResolveResponse {
  const factory _UserResolveResponse({
    required final String id,
    required final String handle,
    required final String fullHandle,
    required final String homeServer,
    required final bool hasDevice,
    required final bool isFederated,
  }) = _$UserResolveResponseImpl;

  factory _UserResolveResponse.fromJson(Map<String, dynamic> json) =
      _$UserResolveResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get handle;
  @override
  String get fullHandle;
  @override
  String get homeServer;
  @override
  bool get hasDevice;
  @override
  bool get isFederated;

  /// Create a copy of UserResolveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResolveResponseImplCopyWith<_$UserResolveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRequest {
  String? get displayName => throw _privateConstructorUsedError;
  UserSettings? get settings => throw _privateConstructorUsedError;

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileRequestCopyWith<$Res> {
  factory $UpdateProfileRequestCopyWith(
    UpdateProfileRequest value,
    $Res Function(UpdateProfileRequest) then,
  ) = _$UpdateProfileRequestCopyWithImpl<$Res, UpdateProfileRequest>;
  @useResult
  $Res call({String? displayName, UserSettings? settings});

  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateProfileRequest
>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? displayName = freezed, Object? settings = freezed}) {
    return _then(
      _value.copyWith(
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            settings: freezed == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as UserSettings?,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $UserSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateProfileRequestImplCopyWith<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$$UpdateProfileRequestImplCopyWith(
    _$UpdateProfileRequestImpl value,
    $Res Function(_$UpdateProfileRequestImpl) then,
  ) = __$$UpdateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayName, UserSettings? settings});

  @override
  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$UpdateProfileRequestImplCopyWithImpl<$Res>
    extends _$UpdateProfileRequestCopyWithImpl<$Res, _$UpdateProfileRequestImpl>
    implements _$$UpdateProfileRequestImplCopyWith<$Res> {
  __$$UpdateProfileRequestImplCopyWithImpl(
    _$UpdateProfileRequestImpl _value,
    $Res Function(_$UpdateProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? displayName = freezed, Object? settings = freezed}) {
    return _then(
      _$UpdateProfileRequestImpl(
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        settings: freezed == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as UserSettings?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileRequestImpl implements _UpdateProfileRequest {
  const _$UpdateProfileRequestImpl({this.displayName, this.settings});

  factory _$UpdateProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileRequestImplFromJson(json);

  @override
  final String? displayName;
  @override
  final UserSettings? settings;

  @override
  String toString() {
    return 'UpdateProfileRequest(displayName: $displayName, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, settings);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
  get copyWith =>
      __$$UpdateProfileRequestImplCopyWithImpl<_$UpdateProfileRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileRequestImplToJson(this);
  }
}

abstract class _UpdateProfileRequest implements UpdateProfileRequest {
  const factory _UpdateProfileRequest({
    final String? displayName,
    final UserSettings? settings,
  }) = _$UpdateProfileRequestImpl;

  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileRequestImpl.fromJson;

  @override
  String? get displayName;
  @override
  UserSettings? get settings;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
