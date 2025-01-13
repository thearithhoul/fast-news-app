import 'package:flutter/material.dart';

import '../../Core/enum/lang_enum.dart';

class Language extends ChangeNotifier {
  Locale _locale = Locale(LangEnum.en.langStr);
  Locale get locale => _locale;

  LangEnum _localeSelected = LangEnum.en;
  LangEnum get localeSelected => _localeSelected;

  void changeLanguage(LangEnum newLang) {
    _locale = Locale(newLang.langStr);
    _localeSelected = newLang;
    notifyListeners();
  }
}
