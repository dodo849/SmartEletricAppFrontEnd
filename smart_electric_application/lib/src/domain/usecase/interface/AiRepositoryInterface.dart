import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';

abstract class AiRepositoryInterface {
  Future<Result<AiReportDTO, String>> requestAiReport(
      {required String customerNumber});
  Future<Result<AiPredictionDTO, String>> requestAiPrediction(
      {required String customerNumber});
    Future<Result<BillCalculationDTO, String>> requestCalculateBill(
      {required String customerNumber,
      required double powerUsageQuantity});
}
