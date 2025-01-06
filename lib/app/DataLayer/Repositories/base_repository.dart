import 'package:dio/dio.dart';
import 'package:fast_news_application/Core/flaver_config.dart';
import 'package:fast_news_application/app/Api_client/app_interceptor.dart';
import 'package:fast_news_application/app/Api_client/dio_client.dart';
import '../../../Core/api_key.dart';

class BaseRepository {
  late DioClient dioClient;
  BaseRepository() {
    var dio = Dio();
    final tokenIntercepter = AppInterceptor(APIKEY);
    dioClient = DioClient(
      dio,
      FlavorConfig.instance.values.baseUrl,
      [tokenIntercepter],
    );
  }
}
