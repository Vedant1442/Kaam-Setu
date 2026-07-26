import 'package:dio/dio.dart';
import 'token_storage.dart';

class ApiClient {
  final Dio dio;
  final TokenStorage tokenStorage;

  ApiClient({required this.tokenStorage, String baseUrl = const String.fromEnvironment('API_URL', defaultValue: 'http://localhost:3000/api')}) 
    : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await tokenStorage.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Token expired, attempt refresh
          final refreshToken = await tokenStorage.getRefreshToken();
          if (refreshToken != null) {
            try {
              final response = await Dio().post(
                '${dio.options.baseUrl}/auth/refresh',
                data: {'refreshToken': refreshToken},
              );
              
              if (response.statusCode == 200) {
                final newAccessToken = response.data['data']['accessToken'];
                await tokenStorage.saveTokens(newAccessToken, refreshToken);
                
                // Retry original request
                e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
                final retryResponse = await dio.fetch(e.requestOptions);
                return handler.resolve(retryResponse);
              }
            } catch (refreshError) {
              await tokenStorage.clearTokens();
              // Navigate to login or emit unauthenticated state
            }
          }
        }
        return handler.next(e);
      }
    ));
  }
}
