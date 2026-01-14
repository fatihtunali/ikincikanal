import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../storage/secure_storage.dart';

class WebSocketMessage {
  final String serverMessageId;
  final String? fromUserId;
  final String envelopeType;
  final DateTime sentAt;

  WebSocketMessage({
    required this.serverMessageId,
    this.fromUserId,
    required this.envelopeType,
    required this.sentAt,
  });

  factory WebSocketMessage.fromJson(Map<String, dynamic> json) {
    return WebSocketMessage(
      serverMessageId: json['serverMessageId'],
      fromUserId: json['fromUserId'],
      envelopeType: json['envelopeType'],
      sentAt: DateTime.parse(json['sentAt']),
    );
  }
}

class TypingEvent {
  final String fromUserId;
  final String? conversationId;
  final bool isTyping;
  final DateTime timestamp;

  TypingEvent({
    required this.fromUserId,
    this.conversationId,
    required this.isTyping,
    required this.timestamp,
  });

  factory TypingEvent.fromJson(Map<String, dynamic> json) {
    return TypingEvent(
      fromUserId: json['fromUserId'],
      conversationId: json['conversationId'],
      isTyping: json['isTyping'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class ReadReceiptEvent {
  final String fromUserId;
  final List<String> messageIds;
  final DateTime readAt;

  ReadReceiptEvent({
    required this.fromUserId,
    required this.messageIds,
    required this.readAt,
  });

  factory ReadReceiptEvent.fromJson(Map<String, dynamic> json) {
    return ReadReceiptEvent(
      fromUserId: json['fromUserId'],
      messageIds: List<String>.from(json['messageIds']),
      readAt: DateTime.parse(json['readAt']),
    );
  }
}

class ReactionEvent {
  final String messageId;
  final String fromUserId;
  final String emoji;
  final String action; // 'add' or 'remove'
  final DateTime timestamp;

  ReactionEvent({
    required this.messageId,
    required this.fromUserId,
    required this.emoji,
    required this.action,
    required this.timestamp,
  });

  factory ReactionEvent.fromJson(Map<String, dynamic> json) {
    return ReactionEvent(
      messageId: json['messageId'],
      fromUserId: json['fromUserId'],
      emoji: json['emoji'],
      action: json['action'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

/// Call signaling events received via WebSocket
class CallEvent {
  final String eventId;
  final String callId;
  final String fromUserId;
  final String fromDeviceId;
  final String eventType; // invite, answer, ice, hangup, reject, busy
  final String encryptedPayload;
  final DateTime receivedAt;

  CallEvent({
    required this.eventId,
    required this.callId,
    required this.fromUserId,
    required this.fromDeviceId,
    required this.eventType,
    required this.encryptedPayload,
    required this.receivedAt,
  });

  factory CallEvent.fromJson(Map<String, dynamic> json) {
    return CallEvent(
      eventId: json['eventId'],
      callId: json['callId'],
      fromUserId: json['fromUserId'],
      fromDeviceId: json['fromDeviceId'],
      eventType: json['eventType'],
      encryptedPayload: json['encryptedPayload'],
      receivedAt: DateTime.parse(json['receivedAt']),
    );
  }
}

class WebSocketService {
  static const String _baseUrl = 'https://api.itinerarytemplate.com';

  final SecureStorageService _storage;
  io.Socket? _socket;

  final _messageController = StreamController<WebSocketMessage>.broadcast();
  final _typingController = StreamController<TypingEvent>.broadcast();
  final _readReceiptController = StreamController<ReadReceiptEvent>.broadcast();
  final _reactionController = StreamController<ReactionEvent>.broadcast();
  final _callEventController = StreamController<CallEvent>.broadcast();
  final _connectionController = StreamController<bool>.broadcast();

  Stream<WebSocketMessage> get messages => _messageController.stream;
  Stream<TypingEvent> get typing => _typingController.stream;
  Stream<ReadReceiptEvent> get readReceipts => _readReceiptController.stream;
  Stream<ReactionEvent> get reactions => _reactionController.stream;
  Stream<CallEvent> get callEvents => _callEventController.stream;
  Stream<bool> get connectionStatus => _connectionController.stream;

  bool get isConnected => _socket?.connected ?? false;

  WebSocketService(this._storage);

  Future<void> connect() async {
    final token = await _storage.getAccessToken();
    if (token == null) return;

    _socket = io.io(
      '$_baseUrl/messages',
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .enableAutoConnect()
          .enableReconnection()
          .build(),
    );

    _socket!.onConnect((_) {
      _connectionController.add(true);
    });

    _socket!.onDisconnect((_) {
      _connectionController.add(false);
    });

    _socket!.on('connected', (data) {
      // Server confirmed connection
    });

    _socket!.on('message', (data) {
      _messageController.add(WebSocketMessage.fromJson(data));
    });

    _socket!.on('typing', (data) {
      _typingController.add(TypingEvent.fromJson(data));
    });

    _socket!.on('read', (data) {
      _readReceiptController.add(ReadReceiptEvent.fromJson(data));
    });

    _socket!.on('reaction', (data) {
      _reactionController.add(ReactionEvent.fromJson(data));
    });

    // Call signaling events
    _socket!.on('call_invite', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.on('call_answer', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.on('call_ice', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.on('call_hangup', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.on('call_reject', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.on('call_busy', (data) {
      _callEventController.add(CallEvent.fromJson(data));
    });

    _socket!.connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }

  void sendTypingStart(String toUserId, {String? conversationId}) {
    _socket?.emit('typing_start', {
      'toUserId': toUserId,
      if (conversationId != null) 'conversationId': conversationId,
    });
  }

  void sendTypingStop(String toUserId, {String? conversationId}) {
    _socket?.emit('typing_stop', {
      'toUserId': toUserId,
      if (conversationId != null) 'conversationId': conversationId,
    });
  }

  void sendReadReceipt(String toUserId, List<String> messageIds) {
    _socket?.emit('read_receipt', {
      'toUserId': toUserId,
      'messageIds': messageIds,
    });
  }

  void dispose() {
    disconnect();
    _messageController.close();
    _typingController.close();
    _readReceiptController.close();
    _reactionController.close();
    _callEventController.close();
    _connectionController.close();
  }
}

final webSocketProvider = Provider<WebSocketService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return WebSocketService(storage);
});
