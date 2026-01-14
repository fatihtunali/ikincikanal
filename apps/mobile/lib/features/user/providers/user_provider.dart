import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';

/// User profile state
class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  UserState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  final UserService _userService;

  UserNotifier(this._userService) : super(const UserState());

  /// Load current user profile
  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _userService.getProfile();
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Update user profile
  Future<bool> updateProfile({
    String? displayName,
    UserSettings? settings,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _userService.updateProfile(
        UpdateProfileRequest(
          displayName: displayName,
          settings: settings,
        ),
      );
      state = state.copyWith(user: user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Resolve user by handle
  Future<UserResolveResponse?> resolveUser(String handle) async {
    try {
      return await _userService.resolveUser(handle);
    } catch (e) {
      return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.watch(userServiceProvider));
});
