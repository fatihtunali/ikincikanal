import 'package:freezed_annotation/freezed_annotation.dart';
import '../user/user.dart';
import '../device/device.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
    required User user,
    required Device device,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
