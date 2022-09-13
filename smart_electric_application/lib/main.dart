import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/page/AIReport.dart';
import 'package:smart_electric_application/src/presentation/view/page/first_access/FirstAccess.dart';
import 'package:smart_electric_application/src/presentation/view/page/Login.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Themes.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
            name: "/Login", page: () => Login(), transition: Transition.fade),
        GetPage(
            name: "/FirstAccess",
            page: () => FirstAccess(),
            transition: Transition.fade),
      ],
    );
  }
}
