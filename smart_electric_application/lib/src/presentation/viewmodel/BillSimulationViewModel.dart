import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/RemoveBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductRemoveDialog.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // Data variables
  RxList<dynamic> billSimulationProducts = <dynamic>[].obs;
  List<int> selectedBillSimulationProducts = <int>[];

  // Pagination Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // Usecase
  var getBillSimulationProductsUsecase = GetBillSimulationProductsUsecase();
  var removeBillSimulationProductsUsecase =
      RemoveBillSimulationProductsUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    getBillSimulationProducts();

    super.onInit();
  }

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }

  /// Fetch bill simulation product from storage
  void getBillSimulationProducts() async {
    Result<dynamic, String> getSimulationProductsResult =
        await getBillSimulationProductsUsecase.execute();

    // 리스트가 존재하면
    if (getSimulationProductsResult.value != null) {
      billSimulationProducts(getSimulationProductsResult.value);
    }
  }

  /// Remove bill simulation product from storage
  void removeBillSimulationProducts() async {
    Result<dynamic, String> removeBillSimulationProductsResult =
        await removeBillSimulationProductsUsecase.execute(selectedBillSimulationProducts);

    // 에러처리 아직 안함.
  }

  void showRemoveWarningDialog(context) {
    showDialog(
        context: context,
        builder: (context) => BillSimulationProductRemoveDialog());
  }
}
