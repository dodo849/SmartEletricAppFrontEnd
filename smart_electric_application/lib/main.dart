
import 'firebase_options.dart';
import 'package:smart_electric_application/src/config/setupDI.dart';
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
  setupDI();
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
            page: () => const AIReport(),
            transition: Transition.native),
        GetPage(
            name: "/Login", page: () => Login(), transition: Transition.fade),
        GetPage(
            name: "/FirstAccess",
            page: () => const FirstAccess(),
            transition: Transition.fade),
      ],
    );
  }
}
