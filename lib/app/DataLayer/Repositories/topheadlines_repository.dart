import 'dart:developer';

import 'package:fast_news_application/app/DataLayer/Repositories/base_repository.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/network_model/api_result.dart';

import '../../helper/str_helper.dart';

class TopheadlinesRepository extends BaseRepository {
  Future<ApiResult<List<Everything>>> getTopheadsNews({
    String? country,
    String? category,
    String? keyword,
    int? pageSize,
  }) async {
    try {
      Map<String, dynamic> param =
          _qurreyParam(country, category, keyword, pageSize);
      print(param);

      final response = await dioClient.get('/top-headlines',
          param: param.isEmpty ? null : param);
      Map<String, dynamic> map = response.data;
      String? status = map['status'];

      if (status == "ok") {
        List<Map<String, dynamic>> data =
            (map['articles'] as List).cast<Map<String, dynamic>>();
        List<Everything> result = data
            .map(
              (e) => Everything.fromJson(e),
            )
            .toList();

        return ApiResult.success(result);
      }
      return ApiResult.failure('${map['message']}');
    } catch (e) {
      log("Error : $e");
      return ApiResult.failure(e.toString());
    }
  }
}

Map<String, dynamic> _qurreyParam(
  String? country,
  String? category,
  String? keyword,
  int? pageSize,
) {
  Map<String, dynamic> map = {};

  if (country != null && country != "") {
    map['country'] = country;
  }
  if (category != null && category != "") {
    map['category'] = category;
  }
  if (keyword != null && keyword != "") {
    map['q'] = keyword;
  }
  if (pageSize != null && pageSize != 0) {
    map['pageSize'] = pageSize;
  }

  return map;
}
