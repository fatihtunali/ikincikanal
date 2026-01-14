import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';

/// Call state machine
enum CallStatus {
  idle,
  outgoingRinging,
  incomingRinging,
  connecting,
  connected,
  ended,
}

class CallState {
  final CallStatus status;
  final String? callId;
  final String? remoteUserId;
  final String? remoteDeviceId;
  final String callType; // 'audio' or 'video'
  final TurnCredentials? turnCredentials;
  final String? error;
  final List<PendingCallEvent> pendingEvents;

  const CallState({
    this.status = CallStatus.idle,
    this.callId,
    this.remoteUserId,
    this.remoteDeviceId,
    this.callType = 'audio',
    this.turnCredentials,
    this.error,
    this.pendingEvents = const [],
  });

  bool get isInCall =>
      status == CallStatus.outgoingRinging ||
      status == CallStatus.incomingRinging ||
      status == CallStatus.connecting ||
      status == CallStatus.connected;

  CallState copyWith({
    CallStatus? status,
    String? callId,
    String? remoteUserId,
    String? remoteDeviceId,
    String? callType,
    TurnCredentials? turnCredentials,
    String? error,
    List<PendingCallEvent>? pendingEvents,
  }) {
    return CallState(
      status: status ?? this.status,
      callId: callId ?? this.callId,
      remoteUserId: remoteUserId ?? this.remoteUserId,
      remoteDeviceId: remoteDeviceId ?? this.remoteDeviceId,
      callType: callType ?? this.callType,
      turnCredentials: turnCredentials ?? this.turnCredentials,
      error: error,
      pendingEvents: pendingEvents ?? this.pendingEvents,
    );
  }
}

class CallsNotifier extends StateNotifier<CallState> {
  final CallsService _callsService;

  CallsNotifier(this._callsService) : super(const CallState());

  /// Get TURN credentials for WebRTC
  Future<TurnCredentials?> getTurnCredentials() async {
    try {
      final credentials = await _callsService.getTurnCredentials();
      state = state.copyWith(turnCredentials: credentials);
      return credentials;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  /// Start outgoing call
  Future<bool> startCall({
    required String toUserId,
    required String callId,
    required String type,
    required String encryptedOffer,
    String? toDeviceId,
  }) async {
    state = state.copyWith(
      status: CallStatus.outgoingRinging,
      callId: callId,
      remoteUserId: toUserId,
      remoteDeviceId: toDeviceId,
      callType: type,
      error: null,
    );

    try {
      await _callsService.sendCallInvite(
        CallInviteRequest(
          toUserId: toUserId,
          toDeviceId: toDeviceId,
          callId: callId,
          type: type,
          encryptedOffer: encryptedOffer,
          createdAt: DateTime.now(),
        ),
      );
      return true;
    } catch (e) {
      state = state.copyWith(status: CallStatus.idle, error: e.toString());
      return false;
    }
  }

  /// Handle incoming call invite
  void handleIncomingInvite(PendingCallEvent event) {
    state = state.copyWith(
      status: CallStatus.incomingRinging,
      callId: event.callId,
      remoteUserId: event.fromUserId,
      remoteDeviceId: event.fromDeviceId,
    );
  }

  /// Answer incoming call
  Future<bool> answerCall({
    required String encryptedAnswer,
  }) async {
    if (state.callId == null || state.remoteUserId == null) return false;

    state = state.copyWith(status: CallStatus.connecting);

    try {
      await _callsService.sendCallSignal(
        CallSignalRequest(
          callId: state.callId!,
          toUserId: state.remoteUserId!,
          toDeviceId: state.remoteDeviceId,
          signalType: 'answer',
          encryptedPayload: encryptedAnswer,
        ),
      );
      state = state.copyWith(status: CallStatus.connected);
      return true;
    } catch (e) {
      state = state.copyWith(status: CallStatus.ended, error: e.toString());
      return false;
    }
  }

  /// Send ICE candidate
  Future<void> sendIceCandidate(String encryptedCandidate) async {
    if (state.callId == null || state.remoteUserId == null) return;

    try {
      await _callsService.sendCallSignal(
        CallSignalRequest(
          callId: state.callId!,
          toUserId: state.remoteUserId!,
          toDeviceId: state.remoteDeviceId,
          signalType: 'ice',
          encryptedPayload: encryptedCandidate,
        ),
      );
    } catch (e) {
      // ICE failures are not fatal
    }
  }

  /// Reject incoming call
  Future<void> rejectCall() async {
    if (state.callId == null || state.remoteUserId == null) {
      state = state.copyWith(status: CallStatus.idle);
      return;
    }

    try {
      await _callsService.sendCallSignal(
        CallSignalRequest(
          callId: state.callId!,
          toUserId: state.remoteUserId!,
          toDeviceId: state.remoteDeviceId,
          signalType: 'reject',
          encryptedPayload: '',
        ),
      );
    } catch (_) {}

    state = state.copyWith(status: CallStatus.idle, callId: null);
  }

  /// End active call
  Future<void> hangup() async {
    if (state.callId == null || state.remoteUserId == null) {
      state = state.copyWith(status: CallStatus.idle);
      return;
    }

    try {
      await _callsService.sendCallSignal(
        CallSignalRequest(
          callId: state.callId!,
          toUserId: state.remoteUserId!,
          toDeviceId: state.remoteDeviceId,
          signalType: 'hangup',
          encryptedPayload: '',
        ),
      );
    } catch (_) {}

    state = state.copyWith(status: CallStatus.ended, callId: null);
  }

  /// Fetch and process pending call events
  Future<void> fetchPendingEvents() async {
    try {
      final response = await _callsService.getPendingCallEvents();
      if (response.events.isNotEmpty) {
        state = state.copyWith(pendingEvents: response.events);
        // Process first invite if not in call
        if (state.status == CallStatus.idle) {
          final invite = response.events
              .where((e) => e.eventType == 'invite')
              .firstOrNull;
          if (invite != null) {
            handleIncomingInvite(invite);
          }
        }
      }
    } catch (e) {
      // Silent fail for polling
    }
  }

  /// Acknowledge call events
  Future<void> acknowledgeEvents(List<String> eventIds) async {
    try {
      await _callsService.acknowledgeCallEvents(
        AckCallEventsRequest(eventIds: eventIds),
      );
      state = state.copyWith(
        pendingEvents:
            state.pendingEvents.where((e) => !eventIds.contains(e.eventId)).toList(),
      );
    } catch (_) {}
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void reset() {
    state = const CallState();
  }
}

final callsProvider = StateNotifierProvider<CallsNotifier, CallState>((ref) {
  return CallsNotifier(ref.watch(callsServiceProvider));
});
