import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'services/auth_service.dart';
import 'services/user_service.dart';
import 'services/device_service.dart';
import 'services/keys_service.dart';
import 'services/messages_service.dart';
import 'services/calls_service.dart';
import 'services/push_service.dart';
import 'services/health_service.dart';

// Export services for use in providers
export 'services/auth_service.dart';
export 'services/user_service.dart';
export 'services/device_service.dart';
export 'services/keys_service.dart';
export 'services/messages_service.dart';
export 'services/calls_service.dart';
export 'services/push_service.dart';
export 'services/health_service.dart';

/// Base Dio instance with proper configuration
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.itinerarytemplate.com',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  final storage = ref.watch(secureStorageProvider);
  dio.interceptors.add(AuthInterceptor(dio, storage));

  return dio;
});

/// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(dioProvider));
});

/// User service provider
final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(dioProvider));
});

/// Device service provider
final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService(ref.watch(dioProvider));
});

/// Keys service provider
final keysServiceProvider = Provider<KeysService>((ref) {
  return KeysService(ref.watch(dioProvider));
});

/// Messages service provider
final messagesServiceProvider = Provider<MessagesService>((ref) {
  return MessagesService(ref.watch(dioProvider));
});

/// Calls service provider
final callsServiceProvider = Provider<CallsService>((ref) {
  return CallsService(ref.watch(dioProvider));
});

/// Push service provider
final pushServiceProvider = Provider<PushService>((ref) {
  return PushService(ref.watch(dioProvider));
});

/// Health service provider
final healthServiceProvider = Provider<HealthService>((ref) {
  return HealthService(ref.watch(dioProvider));
});
