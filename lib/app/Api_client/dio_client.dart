import 'package:dio/dio.dart';

class DioClient {
  final String baseUrl;
  late Dio _dio;
  final List<Interceptor>? interceptors;

  DioClient(this._dio, this.baseUrl, this.interceptors) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Duration.millisecondsPerMinute)
      ..options.receiveTimeout =
          const Duration(milliseconds: Duration.millisecondsPerMinute)
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    _dio.interceptors.add(LogInterceptor());
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
  }

  Future<Response> post(
    String path,
    dynamic data,
  ) async {
    try {
      return await _dio.post(
        path,
        data: data,
      );
    } on DioException {
      throw Exception();
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? param}) async {
    try {
      return await _dio.get(
        path,
        queryParameters: param,
      );
    } on DioException {
      throw Exception();
    }
  }
}
