import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CalculateBillUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageOfSpecificMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

class GetPredictedBillOfThisMonthUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  // Usecase
  final getAiPredictionUsecase = GetAiPredictionUsecase();
  final calculatedBillUsecase = CalculateBillUsecase();

  Future<Result<double, String>> execute() async {
    // Get customer number from device
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("Failed to get customer number");
    }

    // Get ai prediction from server
    Result<dynamic, String> getAiPredictionResult =
        await getAiPredictionUsecase.execute();

    if (getAiPredictionResult.status == ResultStatus.error) {
      return Result.failure(getAiPredictionResult.error);
    }

    // Sum ai prediction of this month
    double pridictedPowerUsageOfThisMonth = 0.0;
    for (var element in getAiPredictionResult.value!.prediction) {
      pridictedPowerUsageOfThisMonth += element.powerUsageQuantity;
    }

    // Calcualte prediction bill
    Result<BillCalculationDTO, String> calculatedBillResult =
        await calculatedBillUsecase.execute(pridictedPowerUsageOfThisMonth);

    if (calculatedBillResult.status == ResultStatus.error) {
      return Result.failure(getAiPredictionResult.error);
    }

    return Result.success(calculatedBillResult.value!.result);
  }
}
