import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/page/MyHome.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';

void main() {
  runApp(const MyApp());
}

ThemeData _lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: LightColors.gray1,
  ),
  colorScheme: const ColorScheme(
    onSurface: LightColors.basic,
    primary: LightColors.orange1, // point color1
    primaryContainer: LightColors.orange2, // point color2
    secondary: LightColors.blue, // point color3
    background: LightColors.gray1, // app backgound
    surface: LightColors.gray2, // card background
    outline: LightColors.gray3, // card line or divider
    surfaceVariant: LightColors.gray4, // disabled
    onPrimary: LightColors.gray5, // text3
    onSecondary:LightColors.gray6, //text2
    onBackground: LightColors.important, //text1
    error: CommonColors.red,  // danger
    tertiary: CommonColors.yellow, // normal
    tertiaryContainer: CommonColors.green, // safe

    onError: LightColors.basic,
    brightness: Brightness.light,
  ),
);

ThemeData _darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: DarkColors.gray1,
  ),
  colorScheme: const ColorScheme(
    onSurface: DarkColors.basic,
    primary: DarkColors.orange1, // point color1
    primaryContainer: DarkColors.orange2, // point color2
    secondary: DarkColors.blue, // point color3
    background: DarkColors.gray1, // app backgound
    surface: DarkColors.gray2, // card background
    outline: DarkColors.gray3, // card line or divider
    surfaceVariant: DarkColors.gray4, // disabled
    onPrimary: DarkColors.gray5, //text3
    onSecondary:DarkColors.gray6, // text2
    onBackground: DarkColors.important, //text1
    error: CommonColors.red, // danger
    tertiary: CommonColors.yellow, // normal
    tertiaryContainer: CommonColors.green, // safe

    onError: DarkColors.basic,
    brightness: Brightness.light,
  ),
);



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      home: MyHome(),
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
