import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryRepository {
  late SharedPreferences prefs;

  SearchHistoryRepository(this.prefs);

  // read
  List<String> getLocal(String key) {
    try {
      List<String>? data = prefs.getStringList(key);
      return data ?? [];
    } catch (e) {
      print('e : $e');
      return [];
    }
  }

  // write or update
  void writeLocal(String key, String value) {
    List<String>? data = prefs.getStringList(key);

    if (data != null) {
      bool isSameValue = data.any(
        (element) => element == value,
      );
      if (isSameValue || value.isEmpty) {
        return;
      }

      data.add(value);
      if (data.length > 10) {
        data.removeAt(0);
      }
      prefs.setStringList(key, data);
      return;
    }
    prefs.setStringList(key, [value]);
  }

  void deleteWhere(String key, int index) {
    List<String>? data = prefs.getStringList(key);
    if (data != null && data.isNotEmpty) {
      data.removeAt(index);
      prefs.setStringList(key, data);
    } else {
      return;
    }
  }
}
