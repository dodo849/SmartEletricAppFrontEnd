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
          dateTimeKr: dateTimeKr, powerUsageQuantity: randomQuantity)
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
  Future<Result<BillCalculationDTO, String>> requestCalculateBill(
      {required String customerNumber,
      required double powerUsageQuantity}) async {
    PowerBillInfoDTO progressiveSectionInfo =
        _createProgressiveSectionInformation();

    // 누진 구간 정보 생성 (0: 누진 구간 1단계, 1: 2단계, 2: 3단계)
    int accumulate = -1;
    if (progressiveSectionInfo.powerAccumulateThresholdFirst >
        powerUsageQuantity) {
      accumulate = 0;
    } else if (progressiveSectionInfo.powerAccumulateThresholdSecond >
        powerUsageQuantity) {
      accumulate = 1;
    } else if (progressiveSectionInfo.powerAccumulateThresholdSuper >
        powerUsageQuantity) {
      accumulate = 2;
    } else {
      accumulate = 3;
    }

    // 누진구간에 따라 요금 계산
    double calculateBill = 0;
    if (accumulate == 0) {
      calculateBill = progressiveSectionInfo.baseBillFirst +
          (powerUsageQuantity * progressiveSectionInfo.powerBillFrist);
    } else if (accumulate == 1) {
      calculateBill = progressiveSectionInfo.baseBillSecond +
          (powerUsageQuantity * progressiveSectionInfo.powerBillSecond);
    } else if (accumulate == 2) {
      calculateBill = progressiveSectionInfo.baseBillThired +
          (powerUsageQuantity * progressiveSectionInfo.powerBillThird);
    } else {
      calculateBill = progressiveSectionInfo.baseBillThired +
          (powerUsageQuantity * progressiveSectionInfo.powerBillSuper);
    }

    // 계산된 값을 DTO에 할당하여 결과 객체를 생성합니다.
    final billCalculationDTO = BillCalculationDTO(
      result: calculateBill,
      accumulate: accumulate,
      powerBillInfo: progressiveSectionInfo,
    );

    // 결과를 성공적으로 반환합니다.
    return Result.success(billCalculationDTO);
  }

  PowerBillInfoDTO _createProgressiveSectionInformation() {
    // FIXME: DTO 이름 수정 필요 '누진 구간 정보'라는 점이 명확하지 않음
    // 기타 계절 기준 누진 구간 정보 임의 생성
    final powerBillInfo = PowerBillInfoDTO(
        powerAccumulateThresholdFirst: 200,
        powerAccumulateThresholdSecond: 400,
        powerAccumulateThresholdSuper: 1000,
        baseBillFirst: 910,
        baseBillSecond: 1600,
        baseBillThired: 7300,
        powerBillFrist: 88.3,
        powerBillSecond: 182.9,
        powerBillThird: 275.6,
        powerBillSuper: 704.5);

    return powerBillInfo;
  }

}
