import 'package:get/get.dart';

class SimulationProductCellViewModel extends GetxController {

  // Pagination Presentation variables
  RxBool isSelected = false.obs; // 셀 선택 bool

  void toggleisSelected(String index) {
    isSelected.isTrue ? isSelected(false) : isSelected(true);

    update([index]);
  }


}
