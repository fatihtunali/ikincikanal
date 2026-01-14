import 'package:dio/dio.dart';
import '../../models/models.dart';

class MessagesService {
  final Dio _dio;

  MessagesService(this._dio);

  /// Send encrypted message
  Future<SendMessageResponse> sendMessage(
    SendMessageRequest request, {
    String? idempotencyKey,
  }) async {
    final response = await _dio.post(
      '/messages/send',
      data: request.toJson(),
      options: Options(
        headers: {
          if (idempotencyKey != null) 'Idempotency-Key': idempotencyKey,
        },
      ),
    );
    return SendMessageResponse.fromJson(response.data);
  }

  /// Send sealed sender message (anonymous)
  Future<SendMessageResponse> sendSealedMessage(
    SealedMessageRequest request, {
    String? idempotencyKey,
  }) async {
    final response = await _dio.post(
      '/messages/send-sealed',
      data: request.toJson(),
      options: Options(
        headers: {
          if (idempotencyKey != null) 'Idempotency-Key': idempotencyKey,
        },
      ),
    );
    return SendMessageResponse.fromJson(response.data);
  }

  /// Fetch pending messages (supports long-polling)
  Future<PendingMessagesResponse> getPendingMessages({
    int limit = 50,
    int waitSeconds = 0,
  }) async {
    final response = await _dio.get('/messages/pending', queryParameters: {
      'limit': limit,
      'waitSeconds': waitSeconds,
    });
    return PendingMessagesResponse.fromJson(response.data);
  }

  /// Acknowledge received messages
  Future<int> acknowledgeMessages(AckMessagesRequest request) async {
    final response = await _dio.post('/messages/ack', data: request.toJson());
    return response.data['ackedCount'] as int;
  }

  /// Delete all pending messages
  Future<int> deleteAllMessages() async {
    final response = await _dio.delete('/messages/delete-all');
    return response.data['deletedCount'] as int;
  }

  /// Create delivery token for sealed sender
  Future<DeliveryToken> createDeliveryToken(
    CreateDeliveryTokenRequest request,
  ) async {
    final response = await _dio.post(
      '/messages/delivery-token',
      data: request.toJson(),
    );
    return DeliveryToken.fromJson(response.data);
  }
}
