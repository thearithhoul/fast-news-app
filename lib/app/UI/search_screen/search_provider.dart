import 'package:fast_news_application/app/Domain/usecases/search_history_usecase.dart';
import 'package:fast_news_application/app/Entities/result_state/result_state.dart';
import 'package:flutter/material.dart';

import '../../Domain/usecases/everything_usecase.dart';
import '../../Domain/usecases/topheadlines_usecase.dart';

class SearchProvider extends ChangeNotifier {
  final SearchHistoryUsecase usecase = SearchHistoryUsecase();
  var resultState = const ResultState.idle();
  String _categorySeleted = 'all';
  String get categorySeleted => _categorySeleted;

  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;
  bool _isShowSearchbox = false;
  bool get isShowSearchbox => _isShowSearchbox;

  final _topheadlinesUsecase = TopheadlinesUsecase();
  final _everythingUsecase = EverythingUsecase();

  void seleteCatagory(String category) {
    _categorySeleted = category.toLowerCase();
    notifyListeners();
  }

  void turnOffHistorySearch() {
    _isShowSearchbox = false;
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

  Future<void> callSearchEverything(String search, {String? language}) async {
    if (search == '') {
      return;
    }
    resultState = const ResultState.loading();
    notifyListeners();

    await usecase.callWriteHistory(search);
    _everythingUsecase.call(search, language: language).then(
      (value) {
        value.when(
          success: (data) {
            resultState = ResultState.data(data);
            _isShowSearchbox = false;
            notifyListeners();
          },
          failure: (error) {
            resultState = ResultState.error(error);
            _isShowSearchbox = false;
            notifyListeners();
          },
        );
      },
    );
  }

  Future<void> getSearchHistory() async {
    _searchHistory = await usecase.callGetHistroy();
    _isShowSearchbox = true;
    notifyListeners();
  }

  void deleteSearchHistory(int index) {
    _searchHistory.removeAt(index);
    usecase.callDeleteHistory(index);
    notifyListeners();
  }
}
