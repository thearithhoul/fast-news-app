import 'package:fast_news_application/app/DataLayer/Repositories/topheadlines_repository.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/network_model/api_result.dart';

import '../../helper/check_image_url.dart';

class TopheadlinesUsecase {
  late final TopheadlinesRepository _topheadlinesRepository;

  TopheadlinesUsecase() {
    _topheadlinesRepository = TopheadlinesRepository();
  }

  Future<ApiResult<List<Everything>>> getRecommendationLocalNews(
      {String? category}) async {
    ApiResult<List<Everything>> data = await _topheadlinesRepository
        .getTopheadsNews(country: 'us', category: category);

    return data.when(
      success: (data) async {
        List<Everything> news = [];
        for (var element in data) {
          if (element.title == "[Removed]") {
            continue;
          } else if (element.author == '') {
            continue;
          }
          bool isImageWork = CheckImageUrl().checkExtention(element.urlToImage);
          if (isImageWork) {
            final temp = element.copyWith(
                urlToImage:
                    CheckImageUrl().removeStringAfterExt(element.urlToImage));
            news.add(temp);
          }
        }

        return ApiResult.success(news);
      },
      failure: (error) {
        return ApiResult.failure(error);
      },
    );
  }
}
