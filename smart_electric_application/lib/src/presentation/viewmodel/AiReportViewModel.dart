import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiReportUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetTodayUsagePredictionUsecase.dart';

class AiReportViewModel extends GetxController {
  // View variables
  RxDouble todayUsagePrediction = 0.0.obs;
  RxDouble todayUsagePredictionBill = 0.0.obs;

  // Usecase
  var getAiPredictionUsecase = GetAiPredictionUsecase();
  var getAiReportUsecase = GetAiReportUsecase();
  var getTodayUsagePredictionUsecase = GetTodayUsagePredictionUsecase();

  @override
  void onInit() {
    // TODO: implement onInit
    requestAiPrediction();

    super.onInit();
  }

  void requestAiPrediction() async {
    // 예측 값 받아오기
    var aiPredictionResult = await getAiPredictionUsecase.excute();

    if (aiPredictionResult.status == ResultStatus.error) {
      // ### 실패 오류 처리하기...
      return;
    }

    AiPredictionDTO aiPredictionDTO = aiPredictionResult.value;

    // 오늘 사용 값 구하기
    var getTodayUsagePredictionResult =
        await getTodayUsagePredictionUsecase.excute(aiPredictionDTO);

    if (getTodayUsagePredictionResult.status == ResultStatus.error) {
      // ### 실패 오류 처리하기...
      return;
    }

    todayUsagePrediction(getTodayUsagePredictionResult.value);
  }

  void requestAiReport() async {
    var aiReportResult = await getAiReportUsecase.excute();
  }
}
