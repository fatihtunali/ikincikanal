import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_token.freezed.dart';
part 'push_token.g.dart';

@freezed
class UpsertPushTokenRequest with _$UpsertPushTokenRequest {
  const factory UpsertPushTokenRequest({
    required String provider,
    required String token,
    String? endpoint,
    String? appBundleId,
  }) = _UpsertPushTokenRequest;

  factory UpsertPushTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertPushTokenRequestFromJson(json);
}
