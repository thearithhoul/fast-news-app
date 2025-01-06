import 'package:fast_news_application/app/Domain/usecases/topheadlines_usecase.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Entities/result_state/result_state.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  var resultState = const ResultState.idle();
  final _topheadlinesUsecase = TopheadlinesUsecase();
  List<Everything> _topNews = [];
  List<Everything> get topNews => _topNews;

  void callEverythingNews() async {
    resultState = const ResultState.loading();
    _topheadlinesUsecase.getRecommendationLocalNews().then(
      (value) {
        value.when(
          success: (data) async {
            _topNews = data.sublist(0, 5);
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
