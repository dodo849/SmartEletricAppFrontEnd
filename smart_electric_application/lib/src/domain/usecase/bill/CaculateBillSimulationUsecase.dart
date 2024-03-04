import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetPowerUsageOfSpecificMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';

/// 선택된 시뮬레이션 가전으로 요금 계산
class CaculateBillSimulationUsecase {
  

  // Usecase
  final getPowerUsageOfThisMonthUsecase = GetPowerUsageOfSpecificMonthUsecase();

  double execute(
      List<BillSimulationProductModel> products) {
    // Sum product bill
    double totalBill = 0.0;
    for (var product in products) {
      totalBill += product.monthPowerUsage / 12;
    }

    return totalBill;
  }
}
