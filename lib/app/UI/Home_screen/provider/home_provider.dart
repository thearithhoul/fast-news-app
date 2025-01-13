import 'package:fast_news_application/app/Domain/usecases/topheadlines_usecase.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/result_state/result_state.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  var resultState = const ResultState.idle();
  final _topheadlinesUsecase = TopheadlinesUsecase();
  List<Everything> _topNews = [];
  List<Everything> get topNews => _topNews;

  Future<void> callTopHeadlineNews(
      {String? country, bool isBuildInit = true}) async {
    resultState = const ResultState.loading();
    if (!isBuildInit) {
      notifyListeners();
    }
    await _topheadlinesUsecase
        .getRecommendationLocalNews(country: country)
        .then(
      (value) {
        value.when(
          success: (data) {
            _topNews = data.length >= 5 ? data.sublist(0, 5) : data;
            resultState = ResultState.data(data);
            notifyListeners();
          },
          failure: (error) {
            resultState = ResultState.error(error);
            notifyListeners();
          },
        );
      },
    );
  }
}
