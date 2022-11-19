import 'package:smart_electric_application/src/presentation/view/page/ContactUs.dart';
import 'package:smart_electric_application/src/presentation/view/page/NotificationSettings.dart';
import 'package:smart_electric_application/src/presentation/view/page/PersonalInfo.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/LoginViewModel.dart';

import 'firebase_options.dart';
import 'package:smart_electric_application/src/config/setupDI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_electric_application/src/presentation/view/page/AiReport.dart';
import 'package:smart_electric_application/src/presentation/view/page/singup/FirstAccess.dart';
import 'package:smart_electric_application/src/presentation/view/page/Login.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Themes.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';

void main() async {
  // Set up DI
  setupDI();

  // Set up firebase settings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Default Setting
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // View model DI
    Get.put(ThemeViewModel());
    Get.put(LoginViewModel());

    // 앱 실행 시 Login 여부 확인 함수 실행
    LoginViewModel.to.checkLogin();

    return GetMaterialApp(
      home: Obx(() => LoginViewModel.to.isLogin.value == false
          ? const Login()
          : const RootScaffold()),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
            name: "/AIReport",
            page: () => const AiReport(),
            transition: Transition.native),
        GetPage(
            name: "/Login", page: () => Login(), transition: Transition.fade),
        GetPage(
            name: "/FirstAccess",
            page: () => const FirstAccess(),
            transition: Transition.fade),
        GetPage(
            name: "/PersonalInfo",
            page: () => const PersonalInfo(),
            transition: Transition.native),
        GetPage(
            name: "/NotificationSettings",
            page: () => const NotificationSettings(),
            transition: Transition.native),
        GetPage(
            name: "/ContactUs",
            page: () => const ContactUs(),
            transition: Transition.native),
      ],
    );
  }
}
