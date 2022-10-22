import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetSimulationProductsUsecase.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // Data variables
  RxList<BillSimulationProductModel> billSimulationProducts =
      <BillSimulationProductModel>[].obs;

  // Pagination Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // Usecase
  var getSimulationProductsUsecase = GetSimulationProductsUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    // Fetch bill simulation product from storage
    

    super.onInit();
  }

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }
}
