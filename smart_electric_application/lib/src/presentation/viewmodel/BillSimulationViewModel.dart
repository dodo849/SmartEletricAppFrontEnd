import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CaculateBillSimulationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillOfThisMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CalculateBillUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/RemoveBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductRemoveDialog.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // - Data variables
  RxList<BillSimulationProductModel> billSimulationProducts =
      <BillSimulationProductModel>[].obs;
  List<int> selectedBillSimulationProducts = <int>[];

  RxString billOfThisMonth = "-".obs;

  // - Pagination Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // - Usecase
  var getBillSimulationProductsUsecase = GetBillSimulationProductsUsecase();
  var removeBillSimulationProductsUsecase =
      RemoveBillSimulationProductsUsecase();
  var getBillOfThisMonthUsecase = GetBillOfThisMonthUsecase();
  var caculateBillSimulationUsecase = CaculateBillSimulationUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    getBillSimulationProducts();

    fetchBillOfThisMonth();

    super.onInit();
  }

  void toggleIsCardOpen() {
    isCardOpen.isTrue ? isCardOpen(false) : isCardOpen(true);
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
            .execute(selectedBillSimulationProducts);

    return;
    // 에러처리 아직 안함.
  }

  void showRemoveWarningDialog(context) {
    showDialog(
        context: context,
        builder: (context) => BillSimulationProductRemoveDialog());
  }

  void fetchBillOfThisMonth() async {
    Result<double, String> getBillOfThisMonthResult =
        await getBillOfThisMonthUsecase.excute();

    if (getBillOfThisMonthResult.status == ResultStatus.error) {
      return;
    } else {
      billOfThisMonth(fomattingWon(getBillOfThisMonthResult.value!));
    }
  }

  void caculateBillSimulation() {
    Iterable<MapEntry<int, BillSimulationProductModel>> productsWhere = billSimulationProducts.value
        .asMap().entries
        .where(
            (element) => selectedBillSimulationProducts.contains(element.key));
    List<BillSimulationProductModel> products = productsWhere.map((e) => e.value).toList();
    var bill = caculateBillSimulationUsecase.excute(products);
  }

  // - Formatter Function
  String fomattingWon(double won) {
    var formatter = NumberFormat('###,###,###,###');
    return formatter.format(won);
  }
}
