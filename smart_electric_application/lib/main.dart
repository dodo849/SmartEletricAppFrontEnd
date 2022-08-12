import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/page/AIReport.dart';
import 'package:smart_electric_application/src/view/page/MyScaffold.dart';
import 'package:smart_electric_application/src/view/theme/Themes.dart';
import 'package:smart_electric_application/src/viewmodel/ThemeViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeViewModel());

    return GetMaterialApp(
      home: MyScaffold(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
            name: "/AIReport",
            page: () => AIReport(),
            transition: Transition.cupertino),
      ],
    );
  }
}
