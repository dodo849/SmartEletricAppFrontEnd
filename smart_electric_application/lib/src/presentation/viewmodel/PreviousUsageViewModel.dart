import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByDayUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByHourUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByMonthUsecase.dart';

class PreviousUsageViewModel extends GetxController {
  static PreviousUsageViewModel get to => Get.find();

  // Presentation variables
  RxBool isBeforeFiveOclock = false.obs;

  // Data variables
  // 일/주/월/연 선택 토글
  RxList<bool> dateUnitToggleButtons = <bool>[true, false, false].obs;
  RxInt dateUnitButtonIndex = 0.obs;
  List<String> dateUnitButtonText = ["일", "월", "연"];

  // Period bar
  RxString displayPeriodBarText = "".obs;
  List<DateTime> periodBarDate = [
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 1))
  ];
  RxBool leftButtonDisabled = false.obs;
  RxBool rightButtonDisabled = false.obs;

  // Banner
  RxString selectedPowerUsage = "0.0".obs;
  RxString selectedDate = "-".obs;

  // Graph data
  List<GraphPointModel> graphPoints = [GraphPointModel("0", 0)];

  // Graph setting
  RxDouble barGap = 20.0.obs;
  RxDouble barWidth = 7.0.obs;
  RxInt barNumber = 24.obs;
  RxDouble maxY = 100.0.obs; // Graph y-axis maximum

  // Graph loading
  RxBool loading = true.obs;

  // Usecase
  var getPowerUsageByHourUsecase = GetPowerUsageByHourUsecase();
  var getPowerUsageByDayUsecase = GetPowerUsageByDayUsecase();
  var getPowerUsageByMonthUsecase = GetPowerUsageByMonthUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // Listener
    // 토글버튼 바뀔때마다 인덱스 관리
    ever(dateUnitToggleButtons, (_) {
      var selectedIndex = dateUnitToggleButtons.indexWhere((value) => value);
      if (selectedIndex != -1) {
        dateUnitButtonIndex(selectedIndex);
      }
    });

    ever(dateUnitButtonIndex, (_) {
      setPeriodBarText();
    });

    ever(displayPeriodBarText, (_) async {
      // 기간 범위 체크
      bool isOver = checkPeriodOverNow();
      setRightButtonDisabled(isOver);

      // 로딩 시작
      loading(true);
      // 데이터 가져오기
      await fetchPowerUsage();
      // 그래프 세팅
      setGraphSetting(graphPoints);
      // 로딩 완료
      loading(false);
    });

    // Initialize

    // 첫 로딩 시 텍스트 설정
    setPeriodBarText();
    // 값 불러오기
    await fetchPowerUsage();
    // 그래프 세팅
    setGraphSetting(graphPoints);
    // 그래프 로딩완료
    loading(false);

    super.onInit();
  }

  void setSelectedDate(int index) {
    String xValue = graphPoints[index].xValue;

    DateTime xDate = DateTime.parse(xValue);

    DateFormat formatter = DateFormat('');
    if (dateUnitButtonIndex.value == 0) {
      // 일단위
      formatter = DateFormat('yy년 M월 d일 h시');
    } else if (dateUnitButtonIndex.value == 1) {
      // 월단위
      formatter = DateFormat('yy년 M월 d일');
    } else if (dateUnitButtonIndex.value == 2) {
      // 연단위
      formatter = DateFormat('yy년 M월');
    }

    selectedDate(formatter.format(xDate));
  }

  void setSelectedPowerUsage(int index) {
    selectedPowerUsage(graphPoints[index].yValue.toStringAsFixed(2));
  }

// ###
  void setIsBeforeFiveOclock() {
    isBeforeFiveOclock(checkBeforeFiveOclock());
  }

  bool checkBeforeFiveOclock() {
    return DateTime.now().hour < 5;
  }

  void setGraphSetting(List<GraphPointModel> graphPoints) {
    barNumber(graphPoints.length);
    maxY(findYMax(graphPoints) * 1.2);
    update();
  }

  // 날짜 바 변경
  void setPeriodBarText() {
    late DateFormat formatter;
    if (dateUnitButtonIndex.value == 0) {
      // 일단위
      formatter = DateFormat('yyyy년 M월 d일');
    } else if (dateUnitButtonIndex.value == 1) {
      // 월단위
      formatter = DateFormat('yyyy년 M월');
    } else if (dateUnitButtonIndex.value == 2) {
      // 연단위
      formatter = DateFormat('yyyy년');
    }

    // 날짜 텍스트 변경
    displayPeriodBarText(
        formatter.format(periodBarDate[dateUnitButtonIndex.value]));
  }

  void subtractDate() {
    // 현재 표시되고 있는 날짜
    DateTime targetDate = periodBarDate[dateUnitButtonIndex.value];

    late DateTime newDate;
    late DateFormat formatter;
    if (dateUnitButtonIndex.value == 0) {
      // 일단위
      newDate = DateTime(targetDate.year, targetDate.month, targetDate.day - 1);
      formatter = DateFormat('yyyy년 M월 d일');
    } else if (dateUnitButtonIndex.value == 1) {
      // 월단위
      newDate = DateTime(targetDate.year, targetDate.month - 1, targetDate.day);
      formatter = DateFormat('yyyy년 M월');
    } else if (dateUnitButtonIndex.value == 2) {
      // 연단위
      newDate = DateTime(targetDate.year - 1, targetDate.month, targetDate.day);
      formatter = DateFormat('yyyy년');
    }

    periodBarDate[dateUnitButtonIndex.value] = newDate;

    // 표시되는 텍스트 변경
    setPeriodBarText();
  }

  void addDate() {
    // 현재 표시되고 있는 날짜
    DateTime targetDate = periodBarDate[dateUnitButtonIndex.value];

    late DateTime newDate;
    late DateFormat formatter;
    if (dateUnitButtonIndex.value == 0) {
      // 일단위
      newDate = DateTime(targetDate.year, targetDate.month, targetDate.day + 1);
      formatter = DateFormat('yyyy년 M월 d일');
    } else if (dateUnitButtonIndex.value == 1) {
      // 월단위
      newDate = DateTime(targetDate.year, targetDate.month + 1, targetDate.day);
      formatter = DateFormat('yyyy년 M월');
    } else if (dateUnitButtonIndex.value == 2) {
      // 연단위
      newDate = DateTime(targetDate.year + 1, targetDate.month, targetDate.day);
      formatter = DateFormat('yyyy년');
    }

    periodBarDate[dateUnitButtonIndex.value] = newDate;

    // 표시되는 텍스트 변경
    setPeriodBarText();
  }

  bool checkPeriodOverNow() {
    DateTime targetDate = periodBarDate[dateUnitButtonIndex.value];

    bool isOver = false;
    if (targetDate.isAfter(DateTime.now().subtract(const Duration(days: 2)))) {
      // 일단위
      isOver = true;
    } else {
      isOver = false;
    }

    return isOver;
  }

  void setRightButtonDisabled(bool disabled) {
    rightButtonDisabled(disabled);
  }

  Future<void> fetchPowerUsage() async {
    DateTime targetDate =
        PreviousUsageViewModel.to.periodBarDate[dateUnitButtonIndex.value];
    // 일단위
    if (dateUnitButtonIndex.value == 0) {
      // 0시 설정
      DateTime startDate =
          DateTime(targetDate.year, targetDate.month, targetDate.day, 0);
      // 23시 설정
      DateTime endDate = startDate.add(const Duration(hours: 23));
      // 형식 조정
      DateFormat formatter = DateFormat('yyyyMMddHH');
      // 네트워킹
      Result<List<GraphPointModel>, String> getPowerUsageResult =
          await getPowerUsageByHourUsecase.excute(
              formatter.format(startDate), formatter.format(endDate));

      if (getPowerUsageResult.status == ResultStatus.error) {
        print("getPowerUsageResult.error ${getPowerUsageResult.error}");
        return;
      }

      graphPoints = getPowerUsageResult.value!;
    }
    // 월단위
    else if (PreviousUsageViewModel.to.dateUnitButtonIndex.value == 1) {
      // 달 설정
      DateTime startDate = DateTime(targetDate.year, targetDate.month);
      // 다음달에서 하루 빼서 달 마지막 날로 설정
      DateTime endDate = DateTime(targetDate.year, targetDate.month + 1)
          .subtract(const Duration(days: 1));
      // 형식 조정
      DateFormat formatter = DateFormat('yyyyMMdd');
      // 네트워킹
      Result<List<GraphPointModel>, String> getPowerUsageResult =
          await getPowerUsageByDayUsecase.excute(
              formatter.format(startDate), formatter.format(endDate));

      if (getPowerUsageResult.status == ResultStatus.error) {
        print("getPowerUsageResult.error ${getPowerUsageResult.error}");
        return;
      }

      graphPoints = getPowerUsageResult.value!;
    }
    // 연단위
    else if (PreviousUsageViewModel.to.dateUnitButtonIndex.value == 2) {
      // 연 설정
      DateTime startDate = DateTime(targetDate.year, 1);
      // 다음달에서 하루 빼서 딜 마지막 날로 설정
      DateTime endDate = DateTime(targetDate.year, 12);
      // 형식 조정
      DateFormat formatter = DateFormat('yyyyMM');
      // 네트워킹
      Result<List<GraphPointModel>, String> getPowerUsageResult =
          await getPowerUsageByMonthUsecase.excute(
              formatter.format(startDate), formatter.format(endDate));

      if (getPowerUsageResult.status == ResultStatus.error) {
        print("getPowerUsageResult.error ${getPowerUsageResult.error}");
        return;
      }

      graphPoints = getPowerUsageResult.value!;
    }

    return;
  }

  double findYMax(List<GraphPointModel> target) {
    double max = 0;
    for (var element in target) {
      if (element.yValue > max) {
        max = element.yValue;
      }
    }
    return max;
  }
}
