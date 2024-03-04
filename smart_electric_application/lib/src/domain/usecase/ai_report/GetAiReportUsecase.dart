import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';

/// Ai 예측 값 받아오기
class GetAiReportUsecase {
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<AiReportDTO, String>> execute() async {
    // 기기에 저장된 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    }

    String customerNumber = getCustomerNumberResult.value!;

    // AI 예측 정보 가져오기
    Result<AiReportDTO, String> requestAiReportResult =
        await aiRepository.requestAiReport(customerNumber: customerNumber);

    return requestAiReportResult;
  }
}
