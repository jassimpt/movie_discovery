import 'package:dio/dio.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';

class DioClient {
  DioClient._();
  static final DioClient _instance = DioClient._();
  static DioClient get instance => _instance;

  late final Dio dio = Dio(
    BaseOptions(
      baseUrl: UrlConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    ),
  )..interceptors.add(AppInterceptor());
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${AppConstants.apiKey}';
    options.headers['accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final message = err.response?.data?['status_message'] ?? err.message;
    print('[DioError] [$statusCode] ${err.requestOptions.uri} — $message');
    handler.next(err);
  }
}
