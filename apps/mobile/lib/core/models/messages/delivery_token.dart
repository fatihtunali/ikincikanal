import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_token.freezed.dart';
part 'delivery_token.g.dart';

@freezed
class DeliveryToken with _$DeliveryToken {
  const factory DeliveryToken({
    required String token,
    required DateTime expiresAt,
    String? forUserId,
  }) = _DeliveryToken;

  factory DeliveryToken.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTokenFromJson(json);
}

@freezed
class CreateDeliveryTokenRequest with _$CreateDeliveryTokenRequest {
  const factory CreateDeliveryTokenRequest({
    required String forSenderType,
    required String forSenderValue,
    @Default(3600) int expiresInSeconds,
    @Default(65536) int maxPayloadBytes,
    @Default(false) bool requireProofOfWork,
  }) = _CreateDeliveryTokenRequest;

  factory CreateDeliveryTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryTokenRequestFromJson(json);
}
