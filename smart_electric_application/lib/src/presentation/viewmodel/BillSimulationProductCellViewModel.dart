import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulationProductCellViewModel extends GetxController {
  // Presentation variables - pagination
  RxBool isSelected = false.obs; // 셀 선택 bool

  void onTapProductCell(index) {
    toggleIsSelected();
    // 상태 변경 후에 List 관리 실행
    manageSelectedProducts(index);
  }

  void toggleIsSelected() {
    isSelected.isTrue ? isSelected(false) : isSelected(true);
  }

  void manageSelectedProducts(index) {
    // 선택된 상태면서 list에 없다면 인덱스 추가
    if (isSelected.isTrue) {
      if (!BillSimulationViewModel.to.selectedProductsIndex
          .contains(index)) {
            BillSimulationViewModel.to.selectedProductsIndex.add(index);
          }
      // 선택 해제 탭이면 요소 삭제
    } else {
      BillSimulationViewModel.to.selectedProductsIndex.remove(index);
    }
  }
}
