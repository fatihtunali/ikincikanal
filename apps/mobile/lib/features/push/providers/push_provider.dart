import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';

/// Push notification state
class PushState {
  final bool isRegistered;
  final String? token;
  final String? provider;
  final bool isLoading;
  final String? error;

  const PushState({
    this.isRegistered = false,
    this.token,
    this.provider,
    this.isLoading = false,
    this.error,
  });

  PushState copyWith({
    bool? isRegistered,
    String? token,
    String? provider,
    bool? isLoading,
    String? error,
  }) {
    return PushState(
      isRegistered: isRegistered ?? this.isRegistered,
      token: token ?? this.token,
      provider: provider ?? this.provider,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class PushNotifier extends StateNotifier<PushState> {
  final PushService _pushService;

  PushNotifier(this._pushService) : super(const PushState());

  /// Register FCM token
  Future<bool> registerFcmToken(String token) async {
    return _registerToken(token, 'fcm');
  }

  /// Register APNS token
  Future<bool> registerApnsToken(String token) async {
    return _registerToken(token, 'apns');
  }

  /// Register unified push token
  Future<bool> registerUnifiedPushToken(String token, String endpoint) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _pushService.upsertPushToken(
        UpsertPushTokenRequest(
          provider: 'unified_push',
          token: token,
          endpoint: endpoint,
        ),
      );
      state = state.copyWith(
        isRegistered: true,
        token: token,
        provider: 'unified_push',
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> _registerToken(String token, String provider) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _pushService.upsertPushToken(
        UpsertPushTokenRequest(
          provider: provider,
          token: token,
        ),
      );
      state = state.copyWith(
        isRegistered: true,
        token: token,
        provider: provider,
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Unregister push token
  Future<bool> unregister() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _pushService.deletePushToken();
      state = state.copyWith(
        isRegistered: false,
        token: null,
        provider: null,
        isLoading: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final pushProvider = StateNotifierProvider<PushNotifier, PushState>((ref) {
  return PushNotifier(ref.watch(pushServiceProvider));
});
