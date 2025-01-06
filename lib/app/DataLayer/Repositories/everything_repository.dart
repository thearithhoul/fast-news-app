import 'dart:developer';

import 'package:fast_news_application/app/DataLayer/Repositories/base_repository.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/network_model/api_result.dart';

import '../../helper/str_helper.dart';

class EverythingRepository extends BaseRepository {
  Future<ApiResult<List<Everything>>> getEverythingNews({
    String? search,
    String? language,
    int? pageSize,
  }) async {
    String quarry = StrHelper.attributesStr({
      "language": language,
      "q": "+$search",
      "pageSize": pageSize,
    });

    try {
      final response = await dioClient.get('/everything?$quarry');
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
