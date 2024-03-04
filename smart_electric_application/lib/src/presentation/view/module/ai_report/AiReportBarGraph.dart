import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetPowerUsageOfYesterdayUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetRecentPowerUsageByHourUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/NoticeBar.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Themes.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AiReportViewModel.dart';

class AiReportBarGraphViewModel extends GetxController {
  // Presentation variables
  RxBool loading = true.obs;
  RxBool isBeforeFiveOclock = false.obs;

  RxDouble maxY = 100.0.obs; // Graph y-axis maximum

  // Data
  List<GraphPointModel> yesterdayUsage = [GraphPointModel("0", 0)];

  // Usecase
  var getPowerUsageOfYesterdayUsecase = GetPowerUsageOfYesterdayUsecase();
  var getResentPowerUsageByHourUsecase = GetRecentPowerUsageByHourUsecase();

  @override
  void onInit() async {
    // 5시 이전인지 체크
    var isBefore = checkBeforeFiveOclock();
    setIsBeforeFiveOclock(isBefore);
    // 5시 이전이면 데이터 fetch X
    if (isBefore) {
      return;
    }

    // 데이터 가져오기
    await fetchPowerUsageOfYesterday();
    // Y 최대값 지정
    maxY(findYMax(yesterdayUsage) * 1.1);
    // 로딩완료
    loading(false);

    super.onInit();
  }

  Future<void> fetchPowerUsageOfYesterday() async {
    Result<List<GraphPointModel>, String> getResentPowerUsageByHourResult =
        await getResentPowerUsageByHourUsecase.execute();
    yesterdayUsage = getResentPowerUsageByHourResult.value!;

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

  void setIsBeforeFiveOclock(bool isBefore) {
    isBeforeFiveOclock(isBefore);
  }

  bool checkBeforeFiveOclock() {
    return DateTime.now().hour < 5;
  }
}

class AiReportBarGraph extends GetView<AiReportBarGraphViewModel> {
  const AiReportBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(AiReportBarGraphViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => controller.isBeforeFiveOclock.isTrue
        ? const NoticeBar(
            content: "새벽 0시부터 5시는 데이터 수집 시간입니다.\n조금만 기다려주세요!",
          )
        : controller.loading.isTrue
            ? const NoticeBar(content: "그래프 로딩중입니다")
            : OverflowBox(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    // y축만 따로 그리는 레이어
                    BarChart(BarChartData(
                      maxY: controller.maxY.value,
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) => Text(
                            "${value.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 11, color: colorTheme.onSurface),
                          ),
                        )),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 20,
                            interval: 1,
                            // x축 빈자리 만들기 위해 빈 Text 위젯 설정
                            getTitlesWidget: (double, TitleMeta) =>
                                const Text(""),
                          ),
                        ),
                      ),
                      // Remove both side border
                      borderData: FlBorderData(
                          border: Border(
                              top: BorderSide(color: colorTheme.outline),
                              bottom: BorderSide(
                                  color: colorTheme.outline, width: 0))),
                      // Remove vertical line
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        drawHorizontalLine: false,
                      ),
                      // Create invisible bar
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                            color: Colors.transparent,
                            toY: 0,
                            width: 0,
                          )
                        ])
                      ],
                    )),
                    // padding으로 y축 공간 살짝 띄기
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 200,
                            maxWidth: 630,
                          ),
                          // 데이터 들어간 바 그래프
                          child: BarChart(
                            BarChartData(
                              maxY: controller.maxY.value,
                              titlesData: FlTitlesData(
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 20,
                                    interval: 1,
                                    getTitlesWidget: _bottomTitleWidgets,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                  border: Border(
                                      top:
                                          BorderSide(color: colorTheme.outline),
                                      bottom: BorderSide(
                                          color: colorTheme.outline,
                                          width: 0))),
                              gridData: FlGridData(
                                  drawVerticalLine: false,
                                  getDrawingHorizontalLine: (value) => FlLine(
                                      color: colorTheme.outline,
                                      strokeWidth: 1,
                                      dashArray: [1, 0])),
                              // Set tooltip
                              barTouchData: BarTouchData(
                                  // getTouchedSpotIndicator: _getTouchedSpotIndicator,
                                  touchTooltipData: BarTouchTooltipData(
                                      getTooltipItem: _getTooltipItem,
                                      tooltipBgColor: const Color(0xFF2D2D2D),
                                      tooltipRoundedRadius: 15,
                                      tooltipPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      tooltipBorder: null)),
                              // read about it in the LineChartData section
                              barGroups:
                                  // data 1
                                  controller.yesterdayUsage
                                      .asMap()
                                      .entries
                                      .map((element) {
                                return BarChartGroupData(
                                  x: element.key.toInt(),
                                  barRods: [
                                    BarChartRodData(
                                      color: _getBarColor(
                                          context, element.key.toInt()),
                                      toY: element.value.yValue,
                                      width: 6,
                                    ),
                                  ],
                                  // showingTooltipIndicators: [0],
                                );
                              }).toList(),
                            ),
                            swapAnimationDuration:
                                const Duration(milliseconds: 150), // Optional
                            swapAnimationCurve: Curves.linear, // Optional
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.normal,
      fontSize: 11,
    );
    Widget text;
    text = Text('${value.toInt()}시', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5.0,
      child: text,
    );
  }

  BarTooltipItem? _getTooltipItem(BarChartGroupData group, int groupIndex,
      BarChartRodData rod, int rodIndex) {
    return BarTooltipItem(
        "",
        const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "${rod.toY.toString()}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: " kWh",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.normal))
        ]);
  }

  List<LineTooltipItem?> _getTooltipItems(List<LineBarSpot> touchedBarSpots) {
    return touchedBarSpots.map((barSpot) {
      final flSpot = barSpot;

      // 이번달이랑 예측에서 겹치는 부분이면 이번달 사용량 그래프의 tooltip null
      print("barSpot ${barSpot.spotIndex}");
      if (barSpot.spotIndex == 6 && barSpot.barIndex == 1) {
        print("return null");
        return null;
      }

      // 텍스트 정렬 설정
      TextAlign textAlign = TextAlign.left;

      // 데이터 종류 라벨 텍스트 설정
      String dataLabelText;
      if (barSpot.barIndex == 0) {
        dataLabelText = '지난달 사용량 \n';
      } else if (barSpot.barIndex == 1) {
        dataLabelText = '이번달 사용량 \n';
      } else {
        dataLabelText = '예상 사용량 \n';
      }

      TextStyle usageTextStyle;
      if (barSpot.barIndex == 0) {
        usageTextStyle = TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal);
      } else if (barSpot.barIndex == 1) {
        usageTextStyle = TextStyle(
            color: LightColors.yellow1,
            fontSize: 18,
            fontWeight: FontWeight.bold);
      } else {
        dataLabelText = '예상 사용량 \n';
        usageTextStyle = TextStyle(
            color: Color.fromARGB(255, 154, 154, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold);
      }

      return LineTooltipItem(
        '',
        // '${flSpot.x.toInt()}일 \n',
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: dataLabelText,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: flSpot.y.toString(),
            style: usageTextStyle,
          ),
          const TextSpan(
            text: ' kWh',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
        textAlign: textAlign,
      );
    }).toList();
  }

  Color? _getBarColor(BuildContext context, int xValue) {
    var colorTheme = context.theme.colorScheme;

    /// 0~23시를 6등분해서 나눠놓은거고 0은 0~4시, 5는 20~24시입니다.
    /// 전력 사용량 기준 내림차순으로 정렬되어 있습니다.
    List<int> timePeriodIndex =
        AiReportViewModel.to.aiReport.value.timePeriodIndex;

    if (timePeriodIndex[0] * 4 <= xValue &&
        xValue < timePeriodIndex[0] * 4 + 4) {
      return colorTheme.primary;
    } else {
      return colorTheme.surfaceVariant;
    }
  }
}
