import 'dart:math';

import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';

class AiMockRepository extends AiRepositoryInterface {
  @override
  Future<Result<AiPredictionDTO, String>> requestAiPrediction(
      {required String customerNumber}) async {
    DateTime now = DateTime.now();

    Random random = Random();

    double randomQuantity = random.nextDouble() * (100 - 50) + 50; // 50~100 사이로
    String dateTimeKr = now.toString();

    AiPredictionDTO aiPrediction = AiPredictionDTO(prediction: [
      DailyPrediction(
          dateTimeKr: dateTimeKr,
          powerUsageQuantity: randomQuantity
      )
    ]);

    return Result.success(aiPrediction);
  }

  @override
  Future<Result<AiReportDTO, String>> requestAiReport(
      {required String customerNumber}) {
    // TODO: implement requestAiReport
    throw UnimplementedError();
  }

  @override
  Future<Result<BillCalculationDTO, String>> requestCalculateBill({
    required String customerNumber,
    required double powerUsageQuantity
  }) async {

    const powerAccumulateThresholdFirst = 200;
    const powerAccumulateThresholdSecond = 400;
    const powerAccumulateThresholdSuper = 1000;

    int accumulate = -1;
    if (powerAccumulateThresholdFirst > powerUsageQuantity) {
      accumulate = 0;
    } else if (powerAccumulateThresholdSecond > powerUsageQuantity) {
      accumulate = 1;
    } else if (powerAccumulateThresholdSuper > powerUsageQuantity) {
      accumulate = 2;
    } else {
      accumulate = 3;
    }

    final powerBillInfo = PowerBillInfoDTO(
        powerAccumulateThresholdFirst: powerAccumulateThresholdFirst,
        powerAccumulateThresholdSecond: powerAccumulateThresholdSecond,
        powerAccumulateThresholdSuper: powerAccumulateThresholdSuper,
        baseBillFirst: 910,
        baseBillSecond: 1600,
        baseBillThired: 7300,
        powerBillFrist: 88.3,
        powerBillSecond: 182.9,
        powerBillThird: 275.6,
        powerBillSuper: 704.5
    );

    // 계산된 값을 DTO에 할당하여 결과 객체를 생성합니다.
    final billCalculationDTO = BillCalculationDTO(
      result: powerUsageQuantity,
      accumulate: accumulate,
      powerBillInfo: powerBillInfo,
    );

    // 결과를 성공적으로 반환합니다.
    return Result.success(billCalculationDTO);
  }
}
