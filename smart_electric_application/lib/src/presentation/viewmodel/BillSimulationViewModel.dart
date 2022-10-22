import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetSimulationProductsUsecase.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // Data variables
  RxList<dynamic> billSimulationProducts = <dynamic>[].obs;

  // Pagination Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // Usecase
  var getSimulationProductsUsecase = GetSimulationProductsUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    getBillSimulationProducts();

    super.onInit();
  }

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }

// Fetch bill simulation product from storage
  void getBillSimulationProducts() async {
    Result<dynamic, String> getSimulationProductsResult =
        await getSimulationProductsUsecase.execute();

    if (getSimulationProductsResult.status == ResultStatus.success) {
      billSimulationProducts(getSimulationProductsResult.value);
    }
  }
}
