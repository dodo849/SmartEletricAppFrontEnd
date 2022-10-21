import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiReportUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';

class AddSimulationProductViewModel extends GetxController {
  static AddSimulationProductViewModel get to => Get.find();

  // View variables
  // 선택된 가전 인덱스(위 productTypes 기준) -> -1은 미선택
  RxInt selectedProductIndex = (-1).obs;

  // Usecase

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
