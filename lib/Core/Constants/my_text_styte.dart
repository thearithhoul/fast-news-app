import 'package:flutter/material.dart';

import 'color_constants.dart';

enum FontType { extraLarge, large, header, title, subtitle, lable }

extension FontTypeExtension on FontType {
  double get size {
    switch (this) {
      case FontType.extraLarge:
        return 32;
      case FontType.large:
        return 24;
      case FontType.header:
        return 19;
      case FontType.title:
        return 17;
      case FontType.subtitle:
        return 15;
      case FontType.lable:
        return 13;
    }
  }
}

class FontFamily {
  FontFamily._();

  static String roboto = 'Roboto';
}

class MYTEXTSTYTE {
  const MYTEXTSTYTE._();

  static TextStyle boldRoboto({
    Color color = ColorConstants.textColor,
    FontWeight weight = FontWeight.bold,
    required FontType fontType,
  }) {
    return TextStyle(
      color: color,
      height: 1,
      fontFamily: FontFamily.roboto,
      fontSize: fontType.size,
      fontWeight: weight,
    );
  }

  static TextStyle lightRoboto({
    Color color = ColorConstants.textColor,
    FontWeight weight = FontWeight.w300,
    required FontType fontType,
  }) {
    return TextStyle(
      color: color,
      fontFamily: FontFamily.roboto,
      fontSize: fontType.size,
      fontWeight: weight,
    );
  }

  static TextStyle mediumRoboto({
    Color color = ColorConstants.textColor,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration,
    required FontType fontType,
  }) {
    return TextStyle(
      color: color,
      decoration: decoration,
      decorationColor: color,
      fontFamily: FontFamily.roboto,
      fontSize: fontType.size,
      fontWeight: weight,
    );
  }

  static TextStyle semiBoldRoboto({
    Color color = ColorConstants.textColor,
    FontWeight weight = FontWeight.w600,
    required FontType fontType,
  }) {
    return TextStyle(
      color: color,
      fontFamily: FontFamily.roboto,
      fontSize: fontType.size,
      fontWeight: weight,
    );
  }
}
