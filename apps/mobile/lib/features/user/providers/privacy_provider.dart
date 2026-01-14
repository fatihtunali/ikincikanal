import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';

/// Privacy operations state
class PrivacyState {
  final bool isLoading;
  final String? error;
  final NukeInitiatedResponse? nukeResponse;
  final DataExport? dataExport;

  const PrivacyState({
    this.isLoading = false,
    this.error,
    this.nukeResponse,
    this.dataExport,
  });

  PrivacyState copyWith({
    bool? isLoading,
    String? error,
    NukeInitiatedResponse? nukeResponse,
    DataExport? dataExport,
  }) {
    return PrivacyState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      nukeResponse: nukeResponse ?? this.nukeResponse,
      dataExport: dataExport ?? this.dataExport,
    );
  }
}

class PrivacyNotifier extends StateNotifier<PrivacyState> {
  final UserService _userService;

  PrivacyNotifier(this._userService) : super(const PrivacyState());

  /// Delete account with password confirmation
  Future<bool> deleteAccount(String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _userService.deleteAccount(
        DeleteAccountRequest(
          password: password,
          confirmation: 'DELETE_MY_ACCOUNT',
        ),
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Initiate nuke (standard mode - 30 second countdown)
  Future<bool> initiateNuke() async {
    state = state.copyWith(isLoading: true, error: null, nukeResponse: null);
    try {
      final response = await _userService.nukeAccount(
        const NukeRequest(mode: 'standard'),
      );
      state = state.copyWith(isLoading: false, nukeResponse: response);
      return response != null;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Confirm nuke with token
  Future<bool> confirmNuke(String nukeToken) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _userService.nukeAccount(
        NukeRequest(mode: 'standard', nukeToken: nukeToken),
      );
      state = state.copyWith(isLoading: false, nukeResponse: null);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Instant nuke with device key signature
  Future<bool> instantNuke(String deviceKeySignature) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _userService.nukeAccount(
        NukeRequest(mode: 'instant', deviceKeySignature: deviceKeySignature),
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Export user data (GDPR)
  Future<DataExport?> exportData() async {
    state = state.copyWith(isLoading: true, error: null, dataExport: null);
    try {
      final export = await _userService.exportData();
      state = state.copyWith(isLoading: false, dataExport: export);
      return export;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearNukeResponse() {
    state = state.copyWith(nukeResponse: null);
  }
}

final privacyProvider =
    StateNotifierProvider<PrivacyNotifier, PrivacyState>((ref) {
  return PrivacyNotifier(ref.watch(userServiceProvider));
});
