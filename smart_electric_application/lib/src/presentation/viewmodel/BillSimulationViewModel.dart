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
  RxBool billSimulationProductsIsEmpty = false.obs;

  // Usecase
  var getSimulationProductsUsecase = GetSimulationProductsUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    getBillSimulationProducts();

    // fetch 할때마다 가전 목록 비어있는지 확인
    ever(billSimulationProducts, (_) {
      billSimulationProducts.value.length == 0
          ? billSimulationProductsIsEmpty(true)
          : billSimulationProductsIsEmpty(false);
    });

    super.onInit();
  }

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }

// Fetch bill simulation product from storage
  void getBillSimulationProducts() async {
    Result<dynamic, String> getSimulationProductsResult =
        await getSimulationProductsUsecase.execute();


    // 리스트가 존재하면
    if (getSimulationProductsResult.value != null) {
      billSimulationProducts(getSimulationProductsResult.value);
      billSimulationProductsIsEmpty(false);
    // 리스트 존재하지않으면
    } else {
      billSimulationProductsIsEmpty(true);
    }
  }
}
