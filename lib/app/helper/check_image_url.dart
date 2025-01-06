import 'package:dio/dio.dart';

class CheckImageUrl {
  Future<bool> testImageUrl(String url) async {
    final dio = Dio();
    dio
      ..options.connectTimeout = const Duration(milliseconds: 100)
      ..options.receiveTimeout = const Duration(milliseconds: 100);
    try {
      final Response result = await dio.get(url);

      if (result.statusCode == 200) {
        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  bool checkExtention(String url) {
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'];
    return imageExtensions.any(
      (element) => url.toLowerCase().contains(element),
    );
  }

  String removeStringAfterExt(String url) {
    return url.split('&')[0];
  }
}
