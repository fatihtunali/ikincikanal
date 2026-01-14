import 'package:dio/dio.dart';
import '../../models/models.dart';

class CallsService {
  final Dio _dio;

  CallsService(this._dio);

  /// Get ephemeral TURN server credentials
  Future<TurnCredentials> getTurnCredentials() async {
    final response = await _dio.get('/calls/turn-credentials');
    return TurnCredentials.fromJson(response.data);
  }

  /// Send call invite
  Future<CallInviteResponse> sendCallInvite(
    CallInviteRequest request, {
    String? idempotencyKey,
  }) async {
    final response = await _dio.post(
      '/calls/invite',
      data: request.toJson(),
      options: Options(
        headers: {
          if (idempotencyKey != null) 'Idempotency-Key': idempotencyKey,
        },
      ),
    );
    return CallInviteResponse.fromJson(response.data);
  }

  /// Send call signal (answer, ICE, hangup, etc.)
  Future<void> sendCallSignal(CallSignalRequest request) async {
    await _dio.post('/calls/signal', data: request.toJson());
  }

  /// Fetch pending call events (supports long-polling)
  Future<PendingCallEventsResponse> getPendingCallEvents({
    int limit = 50,
    int waitSeconds = 0,
  }) async {
    final response = await _dio.get('/calls/events/pending', queryParameters: {
      'limit': limit,
      'waitSeconds': waitSeconds,
    });
    return PendingCallEventsResponse.fromJson(response.data);
  }

  /// Acknowledge call events
  Future<int> acknowledgeCallEvents(AckCallEventsRequest request) async {
    final response = await _dio.post(
      '/calls/events/ack',
      data: request.toJson(),
    );
    return response.data['ackedCount'] as int;
  }
}
