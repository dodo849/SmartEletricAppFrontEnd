import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/domain/model/AiReportModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';

/// Ai 예측 값 받아오기
class CreateAiReportUsecase {
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  var getTodayUsagePredictionUsecase = GetTodayUsagePredictionUsecase();

  Future<Result<AiReportModel, String>> excute() async {
    // 기기에 저장된 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    }

    String customerNumber = getCustomerNumberResult.value!;

    // Ai 리포트 정보 가져오기
    Result<AiReportDTO, String> requestAiReportResult =
        await aiRepository.requestAiReport(customerNumber: customerNumber);

    if (requestAiReportResult.status == ResultStatus.error) {
      return Result.failure(requestAiReportResult.error);
    }

    // Ai 예측 정보 가져오기
    Result<AiPredictionDTO, String> requestAiPredictionResult =
        await aiRepository.requestAiPrediction(customerNumber: customerNumber);

    if (requestAiPredictionResult.status == ResultStatus.error) {
      return Result.failure(requestAiPredictionResult.error);
    }

    // 오늘 에측 사용량 가져오기
    Result<DailyPrediction, String> getTodayUsagePredictionResult =
        getTodayUsagePredictionUsecase.excute(requestAiPredictionResult.value!);

    if (getTodayUsagePredictionResult.status == ResultStatus.error) {
      return Result.failure(requestAiPredictionResult.error);
    }

    // 오늘 예측 사용량 요금 계산하기
    Result<BillCalculationDTO, String> requestCalculateTodayBillResult =
        await aiRepository.requestCalculateBill(
            customerNumber: customerNumber,
            powerUsageQuantity:
                getTodayUsagePredictionResult.value!.powerUsageQuantity);

    if (requestCalculateTodayBillResult.status == ResultStatus.error) {
      return Result.failure(requestCalculateTodayBillResult.error);
    }

    // Result 래핑 꺼내기
    AiReportDTO aiReport = requestAiReportResult.value!;
    DailyPrediction todayPowerUsagePrediction =
        getTodayUsagePredictionResult.value!;
    BillCalculationDTO billCalculation = requestCalculateTodayBillResult.value!;

    // 모델로 매핑해서 return
    return Result.success(AiReportModel(
        timePeriodIndex: aiReport.timePeriodIndex,
        timePeriodPowerUsage: aiReport.timePeriodPowerUsage,
        standbyPower: aiReport.standbyPower,
        weekdayIndex: aiReport.weekdayIndex,
        weekdayPowerUsage: aiReport.weekdayPowerUsage,
        dayOrNight: aiReport.dayOrNight,
        dayTimePowerUsage: aiReport.dayTimePowerUsage,
        nightTimePowerUsage: aiReport.nightTimePowerUsage,
        dayPowerUsageMean: aiReport.dayPowerUsageMean,
        dayPowerUsageMeanInWon: aiReport.dayPowerUsageMeanInWon,
        dayPowerUsageMin: aiReport.dayPowerUsageMin,
        dayPowerUsageMinInWon: aiReport.dayPowerUsageMax,
        dayPowerUsageMax: aiReport.dayPowerUsageMax,
        dayPowerUsageMaxInWon: aiReport.dayPowerUsageMaxInWon,
        predictionBill: billCalculation.result,
        predictionPowerUsage: todayPowerUsagePrediction.powerUsageQuantity,
        predictionSection: billCalculation.accumulate));
  }
}
