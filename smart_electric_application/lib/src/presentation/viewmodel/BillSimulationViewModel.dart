import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CalculateBillUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/DeleteBillSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPredictedPowerUsageOfThisMonthUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductRemoveDialog.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/ProgressiveSectionType.dart';

class BillSimulationViewModel extends GetxController {
  static BillSimulationViewModel get to => Get.find();

  // - Data variables
  RxList<BillSimulationProductModel> billSimulationProducts =
      <BillSimulationProductModel>[].obs;
  RxList<int> selectedProductsIndex = <int>[].obs;
  RxList<BillSimulationProductModel> selectedProducts =
      <BillSimulationProductModel>[].obs;

  RxString billOfThisMonth = "0".obs;
  RxString additionalBill = "0".obs;
  RxString totalBill = "0".obs;
  Rx<ProgressiveSectionType> progressiveSection =
      ProgressiveSectionType.undefined.obs;

  double originalBill = 0.0;
  double originalPowerUsage = 0.0;
  RxInt accumulate = 0.obs;

  // - Presentation variables
  RxBool isCardOpen = false.obs; // 카드 열림/닫힘

  // - Usecase
  var getBillSimulationProductsUsecase = GetBillSimulationProductsUsecase();
  var deleteBillSimulationProductsUsecase =
      DeleteBillSimulationProductsUsecase();
  var getPredictedPowerUsageOfThisMonthUsecase =
      GetPredictedPowerUsageOfThisMonthUsecase();
  var calculateBillUsecase = CalculateBillUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // - Listener
    ever(selectedProductsIndex, (_) {
      // product 모델로 다시 추가
      setSelectedProducts(selectedProductsIndex);
      // 추가요금 계산 요청
      caculateTotalBill();
    });
    ever(billSimulationProducts, (_) {
      // fetch 다시 할 때마다 계산 초기화
      caculateTotalBill();
    });
    ever(accumulate, (int value) {
      setProgressiveSection(value);
    });

    // - Initialize
    getBillSimulationProducts();

    double powerUsage = await fetchPowerUsageOfThisMonth();
    originalPowerUsage = powerUsage;
    double bill = await fetchBillOfThisMonth();
    billOfThisMonth(fomattingWon(bill));
    originalBill = bill;
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
  Future<void> deleteBillSimulationProducts() async {
    List<int?> ids = selectedProducts.map((element) => element.id).toList();

    Result<bool, String> deleteBillSimulationProductsResult =
        await deleteBillSimulationProductsUsecase.execute(ids);

    return;
  }

  /// Show remove warning
  void showRemoveWarningDialog(context) {
    showDialog(
        context: context,
        builder: (context) => BillSimulationProductRemoveDialog());
  }

  Future<double> fetchPowerUsageOfThisMonth() async {
    Result<double, String> getPredictedPowerUsageOfThisMonthResult =
        await getPredictedPowerUsageOfThisMonthUsecase.excute();

    if (getPredictedPowerUsageOfThisMonthResult.status == ResultStatus.error) {
      return 0.0;
    } else {
      return getPredictedPowerUsageOfThisMonthResult.value!;
    }
  }

  Future<double> fetchBillOfThisMonth() async {
    Result<BillCalculationDTO, String> calculateBillResult =
        await calculateBillUsecase.excute(originalPowerUsage);

    if (calculateBillResult.status == ResultStatus.error &&
        calculateBillResult.value != null) {
      return 0.0;
    } else {
      return calculateBillResult.value!.result;
    }
  }

  void caculateTotalBill() async {
    double totalPowerUsage = selectedProducts.fold(0.0,
        (previousValue, element) => previousValue + element.monthPowerUsage);

    Result<BillCalculationDTO, String> calculateBillResult =
        await calculateBillUsecase.excute(totalPowerUsage + originalPowerUsage);

    setAdditionalBill(calculateBillResult.value!.result);
    setTotalBill(calculateBillResult.value!.result);
    setAccumulate(calculateBillResult.value!.accumulate);
  }

  // - Variable setter
  void setAdditionalBill(double bill) {
    additionalBill(fomattingWon(bill - originalBill));
  }

  void setTotalBill(double bill) {
    totalBill(fomattingWon(bill));
  }

  void setAccumulate(int section) {
    accumulate(section);
  }

  void setSelectedProducts(List<int> index) {
    selectedProducts.clear();
    for (var i in index) {
      selectedProducts.add(billSimulationProducts[i]);
    }
  }

  void setProgressiveSection(int accumulate) {
    switch (accumulate) {
      case 0:
        progressiveSection(ProgressiveSectionType.first);
        break;
      case 1:
        progressiveSection(ProgressiveSectionType.second);
        break;
      case 2:
        progressiveSection(ProgressiveSectionType.third);
        break;
    }
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
