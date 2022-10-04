import 'package:get/get.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // Pagination Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }


}
