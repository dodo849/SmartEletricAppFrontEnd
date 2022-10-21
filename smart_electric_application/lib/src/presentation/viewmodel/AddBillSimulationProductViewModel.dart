import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/usecase/AddSimulationProductUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiReportUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';

class AddBillSimulationProductViewModel extends GetxController {
  static AddBillSimulationProductViewModel get to => Get.find();

  // View variables
  // 선택된 가전 인덱스(위 productTypes 기준) -> -1은 미선택
  RxString productName = "".obs;
  RxString modelName = "".obs;
  RxInt selectedProductIndex = (-1).obs;
  RxDouble monthPowerUsage = 0.0.obs;

  RxBool submitButtonEnabled = false.obs;

  // Usecase
  var addSimulationProductUsecase = AddSimulationProductUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    // 입력시마다 submit button 활성화 가능한지 체크
    ever(productName, (_) => checkRequiredInputs());
    ever(selectedProductIndex, (_) => checkRequiredInputs());
    ever(monthPowerUsage, (_) => checkRequiredInputs());

    super.onInit();
  }

  void addBillSimulationProduct(BuildContext context) {
    print("call addBillSimulationProduct");

    addSimulationProductUsecase.execute(BillSimulationProductModel(
        productName: productName.value,
        modelName: modelName.value,
        productType: ProductTypeData.productTypes[selectedProductIndex.value],
        monthPowerUsage: monthPowerUsage.value));
  }

  void checkRequiredInputs(){
    if(productName.value.length != 0 && selectedProductIndex.value != -1 && monthPowerUsage.value != 0.0){
      submitButtonEnabled(true);
    } else {
      submitButtonEnabled(false);
    }
  }
}
