import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String handle,
    required String fullHandle,
    required String homeServer,
    String? displayName,
    required DateTime createdAt,
    @Default('active') String status,
    UserSettings? settings,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    int? defaultDisappearingSeconds,
    @Default(true) bool allowSealedSender,
    @Default(false) bool readReceipts,
    @Default(false) bool typingIndicators,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@freezed
class UserResolveResponse with _$UserResolveResponse {
  const factory UserResolveResponse({
    required String id,
    required String handle,
    required String fullHandle,
    required String homeServer,
    required bool hasDevice,
    required bool isFederated,
  }) = _UserResolveResponse;

  factory UserResolveResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResolveResponseFromJson(json);
}

@freezed
class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    String? displayName,
    UserSettings? settings,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}
