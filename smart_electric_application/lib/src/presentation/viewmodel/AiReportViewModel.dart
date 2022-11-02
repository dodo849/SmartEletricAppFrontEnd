import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/AiReportModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CreateAiReportUsecase.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/ProgressiveSectionType.dart';

class AiReportViewModel extends GetxController {
  static AiReportViewModel get to => Get.find();

  // View variables
  RxDouble todayUsagePrediction = 0.0.obs;
  RxDouble todayUsagePredictionBill = 0.0.obs;

  Rx<ProgressiveSectionType> predictionSectionType = ProgressiveSectionType.undefined.obs;

  RxBool loading = true.obs;
  Rx<AiReportModel> aiReport = AiReportModel(
          timePeriodIndex: [0],
          timePeriodPowerUsage: [],
          standbyPower: 0.0,
          weekdayIndex: [],
          weekdayPowerUsage: [],
          dayOrNight: "",
          dayTimePowerUsage: 0.0,
          nightTimePowerUsage: 0.0,
          dayPowerUsageMean: 0.0,
          dayPowerUsageMeanInWon: 0.0,
          dayPowerUsageMin: 0.0,
          dayPowerUsageMinInWon: 0.0,
          dayPowerUsageMax: 0.0,
          dayPowerUsageMaxInWon: 0.0,
          predictionBill: 0.0,
          predictionPowerUsage: 0.0,
          predictionSection: -1)
      .obs;

  // Usecase
  var createCreateAiReportUsecase = CreateAiReportUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchAiReport();
    loading(false);
    // 예측구간 enum 형 지정
    predictionSectionType(ProgressiveSectionType.values[aiReport.value.predictionSection]);
    print("aiReport ${aiReport}");

    super.onInit();
  }

  Future<void> fetchAiReport() async {
    // 예측 값 받아오기
    var createCreateAiReportResult = await createCreateAiReportUsecase.excute();

    if (createCreateAiReportResult.status == ResultStatus.error) {
      print("createCreateAiReportResult ${createCreateAiReportResult.error}");
      // ### 실패 오류 처리하기...
      return;
    }

    aiReport(createCreateAiReportResult.value!);
    print("aiReport: $aiReport");
    return;
  }

  String fomattingWon(double won) {
    var formatter = NumberFormat('###,###,###,###');
    return formatter.format(won);
  }
}
