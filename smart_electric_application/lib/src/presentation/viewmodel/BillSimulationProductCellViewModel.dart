import 'package:get/get.dart';

class BillSimulationProductCellViewModel extends GetxController {

  // Pagination Presentation variables
  RxBool isSelected = false.obs; // 셀 선택 bool

  void toggleisSelected() {
    isSelected.isTrue ? isSelected(false) : isSelected(true);

    update();
  }

}
