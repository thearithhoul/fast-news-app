enum LangEnum { en, de, fr, ko, es, zh }

extension DisplayX on LangEnum {
  String get langStr {
    switch (this) {
      case LangEnum.en:
        return 'en';
      case LangEnum.de:
        return 'de';
      case LangEnum.fr:
        return 'fr';
      case LangEnum.ko:
        return 'ko';
      case LangEnum.es:
        return 'es';
      case LangEnum.zh:
        return 'zh';
    }
  }
}
