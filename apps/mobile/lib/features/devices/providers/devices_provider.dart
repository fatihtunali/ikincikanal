import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/models/models.dart';

/// Devices list state
class DevicesState {
  final List<Device> devices;
  final bool isLoading;
  final String? error;

  const DevicesState({
    this.devices = const [],
    this.isLoading = false,
    this.error,
  });

  DevicesState copyWith({
    List<Device>? devices,
    bool? isLoading,
    String? error,
  }) {
    return DevicesState(
      devices: devices ?? this.devices,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class DevicesNotifier extends StateNotifier<DevicesState> {
  final DeviceService _deviceService;

  DevicesNotifier(this._deviceService) : super(const DevicesState());

  /// Load all devices
  Future<void> loadDevices() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final devices = await _deviceService.listDevices();
      state = state.copyWith(devices: devices, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Revoke a specific device
  Future<bool> revokeDevice(String deviceId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _deviceService.revokeDevice(deviceId);
      // Remove from local list
      final updated =
          state.devices.where((d) => d.id != deviceId).toList();
      state = state.copyWith(devices: updated, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Revoke all devices except current
  Future<int> revokeAllDevices() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final count = await _deviceService.revokeAllDevices();
      await loadDevices(); // Reload to get updated list
      return count;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return 0;
    }
  }

  /// Revoke all devices including current (panic button)
  Future<bool> revokeAllIncludingCurrent() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _deviceService.revokeAllIncludingCurrent();
      state = state.copyWith(devices: [], isLoading: false);
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

final devicesProvider =
    StateNotifierProvider<DevicesNotifier, DevicesState>((ref) {
  return DevicesNotifier(ref.watch(deviceServiceProvider));
});
