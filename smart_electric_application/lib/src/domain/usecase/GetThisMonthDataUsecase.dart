import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/CalculateBillDTO.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/model/ThisMonthModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetCalculatedBillUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageOfSpecificMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

class GetThisMonthDataUsecase {
  final PowerUsageRepositoryInterface powerUsageRepository =
      GetIt.I.get<PowerUsageRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();
  final AiRepositoryInterface aiRepository =
      GetIt.I.get<AiRepositoryInterface>();

  // Usecase
  var getPowerUsageOfSpecificMonthUsecase =
      GetPowerUsageOfSpecificMonthUsecase();
  var getCalculatedBillUsecase = GetCalculatedBillUsecase();

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
    Result<PowerUsageDTO, String> getPowerUsageOfThisMonthResult =
        await getPowerUsageOfSpecificMonthUsecase.execute(now);

    if (getPowerUsageOfThisMonthResult.status == ResultStatus.error) {
      return Result.failure(getPowerUsageOfThisMonthResult.error);
    }

    // Get bill, progressive section ... of this month
    Result<CalculateBillDTO, String> getCalculatedBillResult =
        await getCalculatedBillUsecase
            .excute(getPowerUsageOfThisMonthResult.value!.powerUsageQuantity);

    if (getCalculatedBillResult.status == ResultStatus.error) {
      return Result.failure(getCalculatedBillResult.error);
    }

    // Get pridected power usage
    Result<AiPredictionDTO, String> requestAiPredictionResult =
        await aiRepository.requestAiPrediction(
            customerNumber: getCustomerNumberResult.value!);

    if (requestAiPredictionResult.status == ResultStatus.error) {
      return Result.failure(requestAiPredictionResult.error);
    }

    // Sum ai pridcited value
    double pridictedPowerUsageOfThisMonth = 0.0;
    requestAiPredictionResult.value!.prediction.map((element) {
      pridictedPowerUsageOfThisMonth += element.powerUsageQuantity;
    });

    // Calculate the pridected power usage
    Result<CalculateBillDTO, String> getCalculatedPredictedBillResult =
        await getCalculatedBillUsecase.excute(pridictedPowerUsageOfThisMonth);

    if (getCalculatedPredictedBillResult.status == ResultStatus.error) {
      return Result.failure(getCalculatedPredictedBillResult.error);
    }

    // Change DTO to Model
    return Result.success(ThisMonthModel(
        userName: getUserNameResult.value!,
        powerUsage: getPowerUsageOfThisMonthResult.value!.powerUsageQuantity,
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
        predictedProgressiveSection:
            getCalculatedPredictedBillResult.value!.accumulate));
  }
}
