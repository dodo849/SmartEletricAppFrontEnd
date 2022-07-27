import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountContoller extends GetxController {
  int count = 0;

  void increase() {
    count++;
    update();
  }
}
