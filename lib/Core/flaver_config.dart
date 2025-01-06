enum Flavor { Dev, Production }

extension FlavorExtension on Flavor {
  String get baseUrl {
    switch (this) {
      case Flavor.Dev:
        return 'https://newsapi.org/v2';
      case Flavor.Production:
        return 'https://newsapi.org/v2';
    }
  }
}

class FlavorValues {
  final String baseUrl;
  FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  FlavorConfig._(this.flavor, this.name, this.values);

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    return _instance ??=
        FlavorConfig._(flavor, StringUtils.enumName(flavor.toString()), values);
  }

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.Production;
  static bool isDevelopment() => _instance?.flavor == Flavor.Dev;
}

class StringUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }
}
