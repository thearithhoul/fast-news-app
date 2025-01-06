import 'package:fast_news_application/app/Entities/result_state/result_state.dart';
import 'package:flutter/material.dart';

import '../../Domain/usecases/everything_usecase.dart';
import '../../Domain/usecases/topheadlines_usecase.dart';

class SearchProvider extends ChangeNotifier {
  var resultState = const ResultState.idle();
  String _categorySeleted = 'all';
  String get categorySeleted => _categorySeleted;

  final _topheadlinesUsecase = TopheadlinesUsecase();
  final _everythingUsecase = EverythingUsecase();

  void seleteCatagory(String category) {
    _categorySeleted = category.toLowerCase();
    notifyListeners();
  }

  void callTopheadLinesNewsWithFilter() {
    resultState = const ResultState.loading();
    _topheadlinesUsecase
        .getRecommendationLocalNews(
            category: _categorySeleted == 'all' ? null : _categorySeleted)
        .then(
      (value) {
        value.when(
          success: (data) {
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

  void callSearchEverything(String search) {
    resultState = const ResultState.loading();
    notifyListeners();
    _everythingUsecase.call(search).then(
      (value) {
        value.when(
          success: (data) {
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
