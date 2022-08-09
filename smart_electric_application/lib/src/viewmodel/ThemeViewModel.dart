import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeViewModel extends GetxController{
  static ThemeViewModel get to => Get.find();

  RxBool isLightTheme = false.obs;

  void changeTheme() {
    if (isLightTheme.isTrue) {
      Get.changeThemeMode(ThemeMode.dark);
      isLightTheme(false);
    } else {
      Get.changeThemeMode(ThemeMode.light);
      isLightTheme(true);
    }
  }
}
