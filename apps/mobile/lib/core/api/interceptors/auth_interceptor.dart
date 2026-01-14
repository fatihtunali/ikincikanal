import 'package:dio/dio.dart';
import '../../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageService _storage;
  bool _isRefreshing = false;

  AuthInterceptor(this._dio, this._storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for public endpoints
    if (_isPublicEndpoint(options.path)) {
      return handler.next(options);
    }

    final token = await _storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request
          final options = err.requestOptions;
          final token = await _storage.getAccessToken();
          options.headers['Authorization'] = 'Bearer $token';
          final response = await _dio.fetch(options);
          _isRefreshing = false;
          return handler.resolve(response);
        }
      } catch (e) {
        _isRefreshing = false;
      }
      _isRefreshing = false;
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) return false;

      // Create a new Dio instance without interceptors to avoid loop
      final refreshDio = Dio(BaseOptions(
        baseUrl: _dio.options.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ));

      final response = await refreshDio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      await _storage.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isPublicEndpoint(String path) {
    const publicPaths = [
      '/auth/register',
      '/auth/login',
      '/auth/passkey/options',
      '/auth/passkey/verify',
      '/auth/refresh',
      '/messages/send-sealed',
      '/health',
      '/.well-known/ikincikanal-server',
    ];
    return publicPaths.any((p) => path.startsWith(p));
  }
}
