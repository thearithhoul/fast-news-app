import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final String token;

  AppInterceptor(this.token);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["X-Api-Key"] = "$token";
    options.headers["Accept"] = "*/*";
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("ERROR INTERCEPT: ${err.message}");
    return handler.next(err);
  }
}
