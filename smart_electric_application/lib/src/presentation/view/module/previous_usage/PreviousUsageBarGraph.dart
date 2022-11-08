import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByHourUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageOfYesterdayUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PreviousUsageViewModel.dart';

class PreviousUsageBarGraphViewModel extends GetxController {
    static PreviousUsageBarGraphViewModel get to => Get.find();
  // Graph setting
  RxDouble barGap = 20.0.obs;
  RxDouble barWidth = 7.0.obs;
  RxInt barNumber = 24.obs;

  // Presentation variables
  RxBool loading = true.obs;

  RxDouble maxY = 100.0.obs; // Graph y-axis maximum

  // Data
  List<GraphPointModel> powerUsage = [GraphPointModel("0", 0)];

  // Usecase
  var getPowerUsageOfYesterdayUsecase = GetPowerUsageOfYesterdayUsecase();


  @override
  void onInit() async {
    // 서버에서 데이터 받아오기

    // Y 최대값 지정
    maxY(findYMax(powerUsage) * 1.1);

    // 로딩완료
    loading(false);

    super.onInit();
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

class PreviousUsageBarGraph extends GetView<PreviousUsageViewModel> {
  const PreviousUsageBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(PreviousUsageBarGraphViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Container(
      height: 250,
      child: Obx(() => controller.loading.isTrue
          ? Text("그래프 로딩중입니다")
          : OverflowBox(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  // y축만 따로 그리는 레이어
                  BarChart(BarChartData(
                    maxY: controller.maxY.value,
                    titlesData: FlTitlesData(
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                        constraints: BoxConstraints(
                          // minWidth: 200,
                          maxWidth: (controller.barGap.value +
                                  controller.barWidth.value +
                                  1) *
                              controller.barNumber.value,
                        ),
                        // 데이터 들어간 바 그래프
                        child: BarChart(
                          BarChartData(
                            maxY: controller.maxY.value,
                            groupsSpace: controller.barGap.value,
                            alignment: BarChartAlignment.center,
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
                                    top: BorderSide(color: colorTheme.outline),
                                    bottom: BorderSide(
                                        color: colorTheme.outline, width: 0))),
                            gridData: FlGridData(
                                drawVerticalLine: false,
                                getDrawingHorizontalLine: (value) => FlLine(
                                    color: colorTheme.outline,
                                    strokeWidth: 1,
                                    dashArray: [1, 0])),
                            // Set tooltip
                            barTouchData: BarTouchData(
                                // getTouchedSpotIndicator: _getTouchedSpotIndicator,
                                touchCallback: (p0, p1) {
                                  if (p1 != null && p1.spot != null) {
                                    PreviousUsageViewModel.to.selectedPowerUsage(
                                        controller
                                            .graphPoints[
                                                p1.spot!.touchedBarGroupIndex]
                                            .yValue
                                            .toStringAsFixed(2));
                                  }
                                },
                                touchTooltipData: BarTouchTooltipData(
                                    getTooltipItem: _getTooltipItem,
                                    tooltipBgColor: Colors.transparent,
                                    tooltipRoundedRadius: 15,
                                    tooltipPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    tooltipBorder: null)),
                            // read about it in the LineChartData section
                            barGroups:
                                // data 1
                                controller.graphPoints
                                    .asMap()
                                    .entries
                                    .map((element) {
                              return BarChartGroupData(
                                x: element.key.toInt(),
                                barRods: [
                                  BarChartRodData(
                                    color: colorTheme.primary,
                                    toY: element.value.yValue,
                                    width: controller.barWidth.value,
                                  ),
                                ],
                                // showingTooltipIndicators: [1],
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
            )),
    );
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
      const TextStyle(color: Colors.transparent, fontSize: 0),
    );
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
}
