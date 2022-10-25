import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';

/// Ai 예측 값 받아오기
class GetAiReportUsecase {
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<dynamic, String>> excute() async {

    // 기기에 저장된 고객번호 가져오기
    Result<String, String> getCustomerNumberResult = await authRepository.getCustomerNumber();

    if(getCustomerNumberResult.status == ResultStatus.error){
      return getCustomerNumberResult;
    }

    String customerNumber = getCustomerNumberResult.value!;

    // AI 예측 정보 가져오기
    var requestAiReportResult =
        await aiRepository.requestAiReport(customerNumber: customerNumber);

    return requestAiReportResult;
  }
}