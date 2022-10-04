import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';

abstract class AiRepositoryInterface {
  Future<Result<AiReportDTO, String>> getAiReportDTO(String customerNumber);
  Future<Result<AiPredictionDTO, String>> getAiPredictionDTO(
      String customerNumber);
}
