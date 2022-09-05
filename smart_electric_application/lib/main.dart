import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/page/AIReport.dart';
import 'package:smart_electric_application/src/presentation/view/page/Login.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Themes.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeViewModel());

    return GetMaterialApp(
      home: RootScaffold(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
            name: "/AIReport",
            page: () => AIReport(),
            transition: Transition.native),
        GetPage(
            name: "/Login",
            page: () => Login(),
            transition: Transition.fade),
      ],
    );
  }
}
