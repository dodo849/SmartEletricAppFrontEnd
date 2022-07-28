import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/View/Page/MyHome.dart';

void main() {
  runApp(const MyApp());
  
}

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: const ButtonThemeData(
  buttonColor: Colors.amber,
  disabledColor: Colors.grey,
));

ThemeData _lightTheme = ThemeData(
  accentColor: Colors.pink,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  buttonTheme: const ButtonThemeData(
  buttonColor: Colors.blue,
  disabledColor: Colors.grey,
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      home: MyHome(),
      // theme: _lightTheme,
      // darkTheme: _darkTheme,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
