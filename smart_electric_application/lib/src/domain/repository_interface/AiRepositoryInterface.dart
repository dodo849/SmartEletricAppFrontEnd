import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';

abstract class AiRepositoryInterface {
  /// Ai 리포트
  Future<Result<AiReportDTO, String>> requestAiReport(
      {required String customerNumber});

  /// 이번달 예상 사용량
  Future<Result<AiPredictionDTO, String>> requestAiPrediction(
      {required String customerNumber});

  /// 사용량으로 누진 정보 계산 (단위: 월)
  Future<Result<BillCalculationDTO, String>> requestCalculateBill(
      {required String customerNumber, required double powerUsageQuantity});
}
