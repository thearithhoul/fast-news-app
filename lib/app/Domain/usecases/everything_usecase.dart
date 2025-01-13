import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/network_model/api_result.dart';
import 'package:fast_news_application/app/helper/check_image_url.dart';

import '../../DataLayer/Repositories/everything_repository.dart';

class EverythingUsecase {
  late final EverythingRepository _everythingRepository;

  EverythingUsecase() {
    _everythingRepository = EverythingRepository();
  }

  Future<ApiResult<List<Everything>>> call(String search,
      {String? language}) async {
    ApiResult<List<Everything>> data =
        await _everythingRepository.getEverythingNews(
      language: language ?? 'en',
      search: search,
      pageSize: 20,
    );

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
