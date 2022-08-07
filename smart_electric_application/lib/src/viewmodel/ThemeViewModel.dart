import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeViewModel extends GetxController{
  RxBool isLightTheme = false.obs;

  void changeTheme() {
    if (isLightTheme == true.obs) {
      Get.changeThemeMode(ThemeMode.dark);
      isLightTheme = false.obs;
    } else {
      Get.changeThemeMode(ThemeMode.light);
      isLightTheme = true.obs;
    }
  }
}
