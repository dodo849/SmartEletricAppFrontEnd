import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/AiReportModel.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CreateAiReportUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetUserUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/ProgressiveSectionType.dart';

class AiReportViewModel extends GetxController {
  AiReportViewModel({required this.context});
  static AiReportViewModel get to => Get.find();

  late final BuildContext context;

  // - Presentation variables
  RxBool loading = true.obs;

  // - Data variables
  RxDouble todayUsagePrediction = 0.0.obs;
  RxDouble todayUsagePredictionBill = 0.0.obs;

  Rx<ProgressiveSectionType> predictionSectionType =
      ProgressiveSectionType.undefined.obs;

  Rx<UserModel> user =
      UserModel(name: "-", email: "-", customerNumber: "-").obs;

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
          predictionSection: 0)
      .obs;

  // - Usecase
  var createAiReportUsecase = CreateAiReportUsecase();
  var getUserUsecase = GetUserUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // 유저 가져오기
    await fetchUser();
    // 리포트 데이터 가져오기
    await fetchAiReport();
    // 로딩 끝
    loading(false);
    // 예측구간 enum 형 지정
    predictionSectionType(
        ProgressiveSectionType.values[aiReport.value.predictionSection]);

    super.onInit();
  }

  // - Data Function
  Future<void> fetchUser() async {
    // 예측 값 받아오기
    Result<UserModel, String> userResult = await getUserUsecase.execute();

    if (userResult.status == ResultStatus.error) {
      return;
    }

    user(userResult.value!);

    return;
  }

  Future<void> fetchAiReport() async {
    // 예측 값 받아오기
    var createAiReportResult = await createAiReportUsecase.execute();

    if (createAiReportResult.status == ResultStatus.error) {
      print("createCreateAiReportResult.error ${createAiReportResult.error}");
      showDialog(
          context: context,
          builder: (context) => CustomDialog(
                title: "",
                content: "네트워크 오류가 발생했습니다. \n잠시 후 다시 시도해주세요.",
                actionButtons: [],
              ));
      return;
    }

    aiReport(createAiReportResult.value!);
    return;
  }

  // - Formatter Function
  String fomattingWon(double won) {
    var formatter = NumberFormat('###,###,###,###');
    return formatter.format(won);
  }
}
