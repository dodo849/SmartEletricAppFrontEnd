import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/model/ThisMonthModel.dart';
import 'package:smart_electric_application/src/domain/usecase/bill/CalculateBillUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetPowerUsageOfSpecificMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/PowerUsageRepositoryInterface.dart';

class CreateThisMonthDataUsecase {
  final PowerUsageRepositoryInterface powerUsageRepository =
      GetIt.I.get<PowerUsageRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();
  final AiRepositoryInterface aiRepository =
      GetIt.I.get<AiRepositoryInterface>();

  // Usecase
  var getPowerUsageOfSpecificMonthUsecase =
      GetPowerUsageOfSpecificMonthUsecase();
  var getCalculatedBillUsecase = CalculateBillUsecase();

  Future<Result<ThisMonthModel, String>> execute() async {
    // Get user name
    Result<String, String> getUserNameResult =
        await authRepository.getUserName();

    if (getUserNameResult.status == ResultStatus.error) {
      return Result.failure(getUserNameResult.error);
    }

    // Get Customer number
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    }

    // Get power usage of this month
    DateTime now = DateTime.now();
    Result<PowerUsageDTO, String> getRecentPowerUsageByMonthResult =
        await powerUsageRepository.getRecentPowerUsageByMonth(
            customerNumber: getCustomerNumberResult.value!);

    if (getRecentPowerUsageByMonthResult.status == ResultStatus.error) {
      return Result.failure(getRecentPowerUsageByMonthResult.error);
    }

    // Get bill, progressive section ... of this month
    Result<BillCalculationDTO, String> getCalculatedBillResult =
        await getCalculatedBillUsecase
            .execute(getRecentPowerUsageByMonthResult.value!.powerUsageQuantity);

    if (getCalculatedBillResult.status == ResultStatus.error) {
      return Result.failure(getCalculatedBillResult.error);
    }

    // Get predected power usage
    Result<AiPredictionDTO, String> requestAiPredictionResult =
        await aiRepository.requestAiPrediction(
            customerNumber: getCustomerNumberResult.value!);

    if (requestAiPredictionResult.status == ResultStatus.error) {
      return Result.failure(requestAiPredictionResult.error);
    }

    // Sum ai prediction
    double pridictedPowerUsageOfThisMonth = 0.0;
    for (var element in requestAiPredictionResult.value!.prediction) {
      pridictedPowerUsageOfThisMonth += element.powerUsageQuantity;
    }

    // Calculate the power usage prediction
    Result<BillCalculationDTO, String> getCalculatedPredictedBillResult =
        await getCalculatedBillUsecase.execute(pridictedPowerUsageOfThisMonth);

    if (getCalculatedPredictedBillResult.status == ResultStatus.error) {
      return Result.failure(getCalculatedPredictedBillResult.error);
    }

    // Change DTO to Model
    return Result.success(ThisMonthModel(
        userName: getUserNameResult.value!,
        powerUsage: getRecentPowerUsageByMonthResult.value!.powerUsageQuantity,
        bill: getCalculatedBillResult.value!.result,
        progressiveSection: getCalculatedPredictedBillResult.value!.accumulate,
        accumulateThresholdFirst: getCalculatedPredictedBillResult
            .value!.powerBillInfo.powerAccumulateThresholdFirst,
        accumulateThresholdSecond: getCalculatedPredictedBillResult
            .value!.powerBillInfo.powerAccumulateThresholdSecond,
        accumulateThresholdSuper: getCalculatedPredictedBillResult
            .value!.powerBillInfo.powerAccumulateThresholdSuper,
        predictionPowerUsage: pridictedPowerUsageOfThisMonth,
        predictionBill: getCalculatedPredictedBillResult.value!.result,
        predictionProgressiveSection:
            getCalculatedPredictedBillResult.value!.accumulate));
  }
}
