import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
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
  ScrollController scrollController = ScrollController();
  late Rx<Color> navigationBarColor = context.theme.colorScheme.primary.obs;

  // - Data variables
  RxDouble todayUsagePrediction = 0.0.obs;
  RxDouble todayUsagePredictionBill = 0.0.obs;
  RxBool isWeekdayMore = false.obs;

  Rx<ProgressiveSectionType> predictionSectionType =
      ProgressiveSectionType.undefined.obs;

  Rx<UserModel> user =
      UserModel(name: "-", email: "-", customerNumber: "-", isSmartMeter: true, billDate: '-')
          .obs;

  late Rx<AiReportModel> aiReport = AiReportModel(
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

    // 스크롤 따라 네비게이션 바 색 바뀌도록 스크롤 이벤트 등록
    scrollController.addListener(() {
      if(scrollController.offset > 230){
        navigationBarColor(context.theme.colorScheme.background);
      } else {
        navigationBarColor(context.theme.colorScheme.primary);
      }
    });

    // 유저 가져오기
    await fetchUser();
    // 리포트 데이터 가져오기
    await fetchAiReport();

    isWeekdayMore(checkIsWeekdayMore(aiReport.value));

    // 로딩 끝
    loading(false);
    // 예측구간 enum 형 지정
    predictionSectionType(
        ProgressiveSectionType.values[aiReport.value.predictionSection]);

    super.onInit();
  }

  // - Data Fetch Function
  Future<void> fetchUser() async {
    Result<UserModel, String> userResult = await getUserUsecase.execute();

    if (userResult.status == ResultStatus.error) {
      return;
    }

    user(userResult.value!);

    return;
  }

  Future<void> fetchAiReport() async {
    // 예측 값 받아오기
    Result<AiReportModel, String> createAiReportResult =
        await createAiReportUsecase.execute();

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

    print("ai report ${createAiReportResult.value!}");

    aiReport(createAiReportResult.value!);
    return;
  }

  // - Business Logic Function
  bool checkIsWeekdayMore(AiReportModel aiReport) {
    // Sum weekday power usage
    double weekdayPowerUsage = aiReport.weekdayPowerUsage.sublist(0, 5).fold(
        0.0, (double previousValue, double element) => previousValue + element) / 5;

    // Sum weekend power usage
    double weekendPowerUsage = aiReport.weekdayPowerUsage.sublist(5).fold(
        0.0, (double previousValue, double element) => previousValue + element) / 2;

    // Compare
    if (weekdayPowerUsage > weekendPowerUsage) {
      return true;
    } else {
      return false;
    }
  }

  // - Formatter Function
  String fomattingWon(double won) {
    var formatter = NumberFormat('###,###,###,###');
    return formatter.format(won);
  }
}
