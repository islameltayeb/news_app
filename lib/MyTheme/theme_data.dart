import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xff39A552);
  static Color accentColor = Colors.white;
  static Color titCategory = Color(0xff4F5A69);

  static ThemeData themeData = ThemeData(
      textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: accentColor,
    ),
    bodyText2: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: titCategory,
    ),
    headline1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: primaryColor,
    ),
    headline2: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Color(0xff79828B),
    ),
    headline3: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xff42505C),

    ),
    headline4: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color(0xffA3A3A3),
    ),
    subtitle1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: accentColor,
    ),
    subtitle2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xff303030),
    ),
    overline: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xff303030),
    ),
  )
  );

}
