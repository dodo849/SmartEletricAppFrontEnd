import 'package:flutter/material.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightColors.basic,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.gray1,
    ),
    fontFamily: 'Pretendard',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: const ColorScheme(
  
      onPrimary: CommonColors.onWhite,
      onSecondary: CommonColors.onWhite,
      primary: LightColors.yellow1, // point color1
      primaryContainer: LightColors.yellow2, // point color1 text
      secondary: LightColors.blue, // point color2
      secondaryContainer: LightColors.purple, // point color3
      background: LightColors.gray1, // app backgound
      surface: LightColors.gray2, // card background
      outline: LightColors.gray3, // card line or divider
      surfaceVariant: LightColors.gray4, // disabled
      onSurface: LightColors.gray5, // text3
      onSurfaceVariant: LightColors.gray6, //text2
      onBackground: LightColors.important, //text1
      error: CommonColors.red, // danger
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe

      onError: LightColors.basic,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: LightColors.important,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: LightColors.important,
      ),
      headline3: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: LightColors.gray5),
      bodyText1: TextStyle(
          color: LightColors.gray5,
          fontSize: 16,
          fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: LightColors.gray5,
          fontSize: 14,
          fontWeight: FontWeight.normal),
    ));

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkColors.basic,
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.gray1,
    ),
    fontFamily: 'Pretendard',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: const ColorScheme(
      onPrimary: CommonColors.onWhite,
      onSecondary: CommonColors.onWhite,
      primary: DarkColors.yellow1, // point color1
      primaryContainer: DarkColors.yellow2, // point color1 text
      secondary: DarkColors.blue, // point color2
      secondaryContainer: DarkColors.purple, // point color3
      background: DarkColors.gray1, // app backgound
      surface: DarkColors.gray2, // card background
      outline: DarkColors.gray3, // card line or divider
      surfaceVariant: DarkColors.gray4, // disabled
      onSurface: DarkColors.gray5, //text3
      onSurfaceVariant: DarkColors.gray6, // text2
      onBackground: DarkColors.important, //text1
      error: CommonColors.red, // danger
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe

      onError: DarkColors.basic, // no use
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: DarkColors.important,
        ),
        headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: DarkColors.important,
        ),
        headline3: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: DarkColors.gray5,
        ),
        bodyText1: TextStyle(
          color: DarkColors.gray5,
          fontSize: 16,
          fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: DarkColors.gray5,
            fontSize: 14,
            fontWeight: FontWeight.normal)));
