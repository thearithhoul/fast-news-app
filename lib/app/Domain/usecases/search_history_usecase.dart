import 'package:shared_preferences/shared_preferences.dart';

import '../../DataLayer/Repositories/search_history_repository.dart';

class SearchHistoryUsecase {
  Future<List<String>> callGetHistroy() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final repo = SearchHistoryRepository(prefs);
    List<String> history = repo.getLocal('search-history');
    return history;
  }

  Future<void> callWriteHistory(String search) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final repo = SearchHistoryRepository(prefs);
    repo.writeLocal('search-history', search);
  }

  void callDeleteHistory(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final repo = SearchHistoryRepository(prefs);
    repo.deleteWhere('search-history', index);
  }
}
