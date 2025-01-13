import 'package:fast_news_application/Core/Constants/image_constants.dart';
import 'package:flutter/material.dart';

import '../enum/lang_enum.dart';

class InitValue {
  static List<DrawerTileObj> drawerList = [];
  static List<String> categorylist = [
    'All',
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  static List<LanguageObj> langSupportsList = [
    LanguageObj(
      langCode: LangEnum.en,
      countryName: 'English',
      flagImg: ImageConstants.enFlag,
    ),
    LanguageObj(
      langCode: LangEnum.es,
      countryName: 'Spanish',
      flagImg: ImageConstants.esFlag,
    ),
    LanguageObj(
      langCode: LangEnum.fr,
      countryName: 'French',
      flagImg: ImageConstants.frFlag,
    ),
    LanguageObj(
      langCode: LangEnum.de,
      countryName: 'German',
      flagImg: ImageConstants.deFlag,
    ),
    LanguageObj(
      langCode: LangEnum.ko,
      countryName: 'Korean',
      flagImg: ImageConstants.koFlag,
    ),
    LanguageObj(
      langCode: LangEnum.zh,
      countryName: 'Mandarin',
      flagImg: ImageConstants.zhFlag,
    ),
  ];
}

class DrawerTileObj {
  final String name;
  final String icon;
  final Widget? trailing;
  DrawerTileObj(this.name, this.icon, {this.trailing});
}

class LanguageObj {
  final LangEnum langCode;
  final String countryName;
  final String flagImg;
  LanguageObj(
      {required this.langCode,
      required this.countryName,
      required this.flagImg});
}
