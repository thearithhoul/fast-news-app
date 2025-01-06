enum Path { iconPath }

extension PathExtension on Path {
  String get assetPath {
    switch (this) {
      case Path.iconPath:
        return 'assets/svg_icon/';
    }
  }
}

class IconConstants {
  static String menuIcon = '${Path.iconPath.assetPath}Hamburger_LG.svg';
  static String backIcon = '${Path.iconPath.assetPath}Chevron_Left.svg';
  static String perosnIcon = '${Path.iconPath.assetPath}User_01.svg';
  static String moreOptionIcon =
      '${Path.iconPath.assetPath}More_Horizontal.svg';
  static String externalLinkIcon =
      '${Path.iconPath.assetPath}External_Link.svg';
  static String searchIcon =
      '${Path.iconPath.assetPath}Search_Magnifying_Glass.svg';
  static String notification = '${Path.iconPath.assetPath}Bell.svg';
  static String hasNotification =
      '${Path.iconPath.assetPath}bell_notification.svg';
}
