import 'package:flutter/material.dart';

import 'Constants/color_constants.dart';
import 'Constants/my_text_styte.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorConstants.primaryColor,
      scaffoldBackgroundColor: ColorConstants.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.appbarColor,
        elevation: 0,
        titleTextStyle: MYTEXTSTYTE.mediumRoboto(fontType: FontType.title),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorConstants.buttonColor,
        textTheme: ButtonTextTheme.normal,
      ),
    );
  }
}
