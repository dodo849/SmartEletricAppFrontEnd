import 'package:get/get_state_manager/get_state_manager.dart';

class CountContoller extends GetxController {
  int count = 0;

  // Usecase
  // var aiReportUsecase = Ai

  void increase() {
    count++;
    update();
  }


  
}
