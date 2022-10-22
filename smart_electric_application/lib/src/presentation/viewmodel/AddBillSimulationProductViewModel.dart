import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/usecase/AddSimulationProductUsecase.dart';

class AddBillSimulationProductViewModel extends GetxController {
  static AddBillSimulationProductViewModel get to => Get.find();

  // View variables
  // 선택된 가전 인덱스(위 productTypes 기준) -> -1은 미선택
  RxString productName = "".obs;
  RxString modelName = "".obs;
  RxInt selectedProductIndex = (-1).obs;
  RxString monthPowerUsage = "".obs;

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

  /// 시뮬레이션 가전 내부 저장소에 저장하기
  void addBillSimulationProduct() async {
    Result<dynamic, String> result = await addSimulationProductUsecase.execute(
        BillSimulationProductModel(
            productName: productName.value,
            modelName: modelName.value,
            productType:
                ProductTypeData.productTypes[selectedProductIndex.value],
            monthPowerUsage: double.parse(monthPowerUsage.value)));
  }

  /// 필수 항목 전부 입력했는지 확인
  void checkRequiredInputs() {
    if (productName.value.length != 0 &&
        selectedProductIndex.value != -1 &&
        monthPowerUsage.value != 0.0) {
      submitButtonEnabled(true);
    } else {
      submitButtonEnabled(false);
    }
  }
}
