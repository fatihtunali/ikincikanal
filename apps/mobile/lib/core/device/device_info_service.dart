import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service for getting device information
class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo;

  DeviceInfoService() : _deviceInfo = DeviceInfoPlugin();

  /// Get a human-readable device name for registration
  /// Examples:
  /// - iOS: "iPhone 15 Pro (iOS 17.2)"
  /// - Android: "Samsung Galaxy S24 (Android 14)"
  Future<String> getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        return await _getAndroidDeviceName();
      } else if (Platform.isIOS) {
        return await _getIOSDeviceName();
      } else if (Platform.isMacOS) {
        return await _getMacOSDeviceName();
      } else if (Platform.isWindows) {
        return await _getWindowsDeviceName();
      } else if (Platform.isLinux) {
        return await _getLinuxDeviceName();
      }
      return 'Unknown Device';
    } catch (e) {
      return 'Flutter App';
    }
  }

  Future<String> _getAndroidDeviceName() async {
    final info = await _deviceInfo.androidInfo;
    final manufacturer = _capitalize(info.manufacturer);
    final model = info.model;
    final version = info.version.release;

    // Avoid redundancy like "Samsung Samsung Galaxy"
    if (model.toLowerCase().startsWith(manufacturer.toLowerCase())) {
      return '$model (Android $version)';
    }
    return '$manufacturer $model (Android $version)';
  }

  Future<String> _getIOSDeviceName() async {
    final info = await _deviceInfo.iosInfo;
    final deviceName = _mapIOSModelToName(info.utsname.machine);
    final version = info.systemVersion;
    return '$deviceName (iOS $version)';
  }

  Future<String> _getMacOSDeviceName() async {
    final info = await _deviceInfo.macOsInfo;
    final model = info.model;
    final version = info.osRelease;
    return '$model (macOS $version)';
  }

  Future<String> _getWindowsDeviceName() async {
    final info = await _deviceInfo.windowsInfo;
    final computerName = info.computerName;
    final version = info.displayVersion;
    return '$computerName (Windows $version)';
  }

  Future<String> _getLinuxDeviceName() async {
    final info = await _deviceInfo.linuxInfo;
    final name = info.prettyName;
    return name;
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Map iOS model identifiers to human-readable names
  /// See: https://gist.github.com/adamawolf/3048717
  String _mapIOSModelToName(String model) {
    final iphoneMap = {
      // iPhone 16 series
      'iPhone17,1': 'iPhone 16 Pro',
      'iPhone17,2': 'iPhone 16 Pro Max',
      'iPhone17,3': 'iPhone 16',
      'iPhone17,4': 'iPhone 16 Plus',
      // iPhone 15 series
      'iPhone16,1': 'iPhone 15 Pro',
      'iPhone16,2': 'iPhone 15 Pro Max',
      'iPhone15,4': 'iPhone 15',
      'iPhone15,5': 'iPhone 15 Plus',
      // iPhone 14 series
      'iPhone15,2': 'iPhone 14 Pro',
      'iPhone15,3': 'iPhone 14 Pro Max',
      'iPhone14,7': 'iPhone 14',
      'iPhone14,8': 'iPhone 14 Plus',
      // iPhone 13 series
      'iPhone14,2': 'iPhone 13 Pro',
      'iPhone14,3': 'iPhone 13 Pro Max',
      'iPhone14,4': 'iPhone 13 mini',
      'iPhone14,5': 'iPhone 13',
      // iPhone 12 series
      'iPhone13,1': 'iPhone 12 mini',
      'iPhone13,2': 'iPhone 12',
      'iPhone13,3': 'iPhone 12 Pro',
      'iPhone13,4': 'iPhone 12 Pro Max',
      // iPhone 11 series
      'iPhone12,1': 'iPhone 11',
      'iPhone12,3': 'iPhone 11 Pro',
      'iPhone12,5': 'iPhone 11 Pro Max',
      // iPhone SE
      'iPhone14,6': 'iPhone SE (3rd gen)',
      'iPhone12,8': 'iPhone SE (2nd gen)',
      // iPad models (common ones)
      'iPad14,1': 'iPad Pro 11" (4th gen)',
      'iPad14,2': 'iPad Pro 11" (4th gen)',
      'iPad14,3': 'iPad Pro 12.9" (6th gen)',
      'iPad14,4': 'iPad Pro 12.9" (6th gen)',
      'iPad13,16': 'iPad Air (5th gen)',
      'iPad13,17': 'iPad Air (5th gen)',
    };

    return iphoneMap[model] ?? 'iPhone';
  }

  /// Get platform identifier for analytics/logging
  String getPlatform() {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isWindows) return 'windows';
    if (Platform.isLinux) return 'linux';
    return 'unknown';
  }
}

/// Provider for DeviceInfoService
final deviceInfoProvider = Provider<DeviceInfoService>((ref) {
  return DeviceInfoService();
});
