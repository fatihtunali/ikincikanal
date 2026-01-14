import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_response.freezed.dart';
part 'health_response.g.dart';

@freezed
class HealthResponse with _$HealthResponse {
  const factory HealthResponse({
    required bool ok,
    required String service,
    required String version,
    required DateTime time,
    required FederationStatus federation,
  }) = _HealthResponse;

  factory HealthResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthResponseFromJson(json);
}

@freezed
class FederationStatus with _$FederationStatus {
  const factory FederationStatus({
    required bool enabled,
    required String serverHandle,
    required int connectedServers,
  }) = _FederationStatus;

  factory FederationStatus.fromJson(Map<String, dynamic> json) =>
      _$FederationStatusFromJson(json);
}
