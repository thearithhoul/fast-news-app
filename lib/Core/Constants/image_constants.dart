enum Path { flagsPath, imagePath }

extension PathExtension on Path {
  String get assetPath {
    switch (this) {
      case Path.flagsPath:
        return 'assets/flags/';
      case Path.imagePath:
        return 'assets/images/';
    }
  }
}

class ImageConstants {
  // Flags
  static String frFlag =
      '${Path.flagsPath.assetPath}Flag_of_France_Flat_Round-1024x1024.png';
  static String enFlag =
      '${Path.flagsPath.assetPath}Flag_of_United_States_Flat_Round-1024x1024.png';
  static String deFlag =
      '${Path.flagsPath.assetPath}Flag_of_Germany_Flat_Round-1024x1024.png';
  static String koFlag =
      '${Path.flagsPath.assetPath}Flag_of_South_Korea_Flat_Round-1024x1024.png';
  static String esFlag =
      '${Path.flagsPath.assetPath}Flag_of_Spain_Flat_Round-1024x1024.png';
  static String zhFlag =
      '${Path.flagsPath.assetPath}Flag_of_Peoples_Republic_of_China_Flat_Round-1024x1024.png';

  // Image
  static String defaultImage =
      '${Path.imagePath.assetPath}default-featured-image.jpg';
}
