import 'package:fast_news_application/Core/Constants/image_constants.dart';
import 'package:fast_news_application/Core/enum/lang_enum.dart';

class FlagMapper {
  static Map<LangEnum, String> flagMapping = {
    LangEnum.de: ImageConstants.deFlag,
    LangEnum.en: ImageConstants.enFlag,
    LangEnum.es: ImageConstants.esFlag,
    LangEnum.fr: ImageConstants.frFlag,
    LangEnum.ko: ImageConstants.koFlag,
    LangEnum.zh: ImageConstants.zhFlag,
  };
}
