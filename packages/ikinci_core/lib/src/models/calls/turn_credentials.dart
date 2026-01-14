import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_credentials.freezed.dart';
part 'turn_credentials.g.dart';

@freezed
class TurnCredentials with _$TurnCredentials {
  const factory TurnCredentials({
    required List<String> urls,
    required String username,
    required String credential,
    required int ttlSeconds,
    required DateTime expiresAt,
    @Default('relay') String iceTransportPolicy,
  }) = _TurnCredentials;

  factory TurnCredentials.fromJson(Map<String, dynamic> json) =>
      _$TurnCredentialsFromJson(json);
}
