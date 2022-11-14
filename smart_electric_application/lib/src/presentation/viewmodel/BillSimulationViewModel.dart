import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CaculateBillSimulationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillOfThisMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/RemoveBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductRemoveDialog.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // - Data variables
  RxList<BillSimulationProductModel> billSimulationProducts =
      <BillSimulationProductModel>[].obs;
  RxList<int> selectedProductsIndex = <int>[].obs;
  RxList<BillSimulationProductModel> selectedBillSimulationProducts =
      <BillSimulationProductModel>[].obs;

  RxString billOfThisMonth = "-".obs;
  RxString additionalBill = "0".obs;
  RxString totalBill = "-".obs;

  double originalBill = 0.0;

  // - Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // - Usecase
  var getBillSimulationProductsUsecase = GetBillSimulationProductsUsecase();
  var removeBillSimulationProductsUsecase =
      RemoveBillSimulationProductsUsecase();
  var getBillOfThisMonthUsecase = GetBillOfThisMonthUsecase();
  var caculateBillSimulationUsecase = CaculateBillSimulationUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // - Listener
    ever(selectedProductsIndex, (_) {
      caculateAdditionalBill();
    });

    // - Initialize
    getBillSimulationProducts();

    await fetchBillOfThisMonth();

    totalBill(fomattingWon(originalBill));

    super.onInit();
  }

  /// Fetch bill simulation product from storage
  Future<void> getBillSimulationProducts() async {
    Result<dynamic, String> getSimulationProductsResult =
        await getBillSimulationProductsUsecase.execute();

    // 리스트가 존재하면
    if (getSimulationProductsResult.value != null) {
      billSimulationProducts(getSimulationProductsResult.value);
    } else {
      billSimulationProducts([]);
    }

    return;
  }

  /// Remove bill simulation product from storage
  Future<void> removeBillSimulationProducts() async {
    Result<bool, String> removeBillSimulationProductsResult =
        await removeBillSimulationProductsUsecase
            .execute(selectedProductsIndex);

    return;
  }

  /// Show remove warning
  void showRemoveWarningDialog(context) {
    showDialog(
        context: context,
        builder: (context) => BillSimulationProductRemoveDialog());
  }

  Future<void> fetchBillOfThisMonth() async {
    Result<double, String> getBillOfThisMonthResult =
        await getBillOfThisMonthUsecase.excute();

    if (getBillOfThisMonthResult.status == ResultStatus.error) {
    } else {
      billOfThisMonth(fomattingWon(getBillOfThisMonthResult.value!));
      originalBill = getBillOfThisMonthResult.value!;
    }

    return;
  }

  void caculateAdditionalBill() {
    Iterable<MapEntry<int, BillSimulationProductModel>> productsWhere =
        billSimulationProducts.value
            .asMap()
            .entries
            .where((element) => selectedProductsIndex.contains(element.key));
    List<BillSimulationProductModel> products =
        productsWhere.map((e) => e.value).toList();
    double bill = caculateBillSimulationUsecase.excute(products);

    setAdditionalBill(bill);
    setTotalBill(bill);
  }

  // - Data setter
  void setAdditionalBill(double bill) {
    additionalBill(fomattingWon(bill));
  }

  void setTotalBill(double bill) {
    totalBill(fomattingWon(bill + originalBill));
  }

  // - Presentation Funtion
  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
  }

  // - Formatter Function
  String fomattingWon(double won) {
    var formatter = NumberFormat('###,###,###,###');
    return formatter.format(won);
  }
}
