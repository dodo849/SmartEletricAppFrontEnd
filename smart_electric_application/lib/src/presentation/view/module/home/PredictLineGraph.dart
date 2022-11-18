import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PredictLineGraphViewModel.dart';

class PredictLineGraph extends GetView<PredictLineGraphViewModel> {
  const PredictLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(PredictLineGraphViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => controller.loading.isTrue
        ? Container()
        : Stack(
            children: [
              // y축 & 그리드
              LineChart(LineChartData(
                  minX: controller.maxY.value,
                  maxX: 0,
                  maxY: controller.maxY.value,
                  showingTooltipIndicators: [],
                  titlesData: FlTitlesData(
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    // leftTitles: AxisTitles(
                    //     sideTitles: SideTitles(
                    //         showTitles: true, interval: 20, reservedSize: 30,)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        interval: 1,
                        // x축 빈자리 만들기 위해 빈 Text 위젯 설정
                        getTitlesWidget: (double, TitleMeta) => const Text(""),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  borderData: FlBorderData(
                      border: const Border(
                          top: BorderSide(width: 0),
                          bottom: BorderSide(width: 0))),
                  gridData: FlGridData(
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                          color: colorTheme.outline,
                          strokeWidth: 1,
                          dashArray: [1, 0])),

                  // Set tooltip
                  lineTouchData: LineTouchData(
                      getTouchedSpotIndicator: _getTouchedSpotIndicator,
                      touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: _getTooltipItems,
                          tooltipBgColor: const Color(0xFF2D2D2D),
                          tooltipRoundedRadius: 15,
                          tooltipPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          tooltipBorder: null)),
                  lineBarsData: [
                    // data 1
                    LineChartBarData(
                      dotData: FlDotData(
                        show: false,
                      ),
                      spots: [FlSpot(0, 0)],
                    ),
                  ])),

              // 실 데이터
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      // minWidth: 200,
                      maxWidth: 1000,
                    ),
                    child: LineChart(
                      LineChartData(
                          minX: controller.minX.value,
                          maxX: controller.maxX.value + 1,
                          maxY: controller.maxY.value,
                          showingTooltipIndicators: [],
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
                                  top: BorderSide(
                                      width: 0, color: colorTheme.surface),
                                  bottom: BorderSide(
                                      color: colorTheme.outline, width: 2))),
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false,
                          ),
                          clipData: FlClipData.all(),

                          // Set tooltip
                          lineTouchData: LineTouchData(
                              getTouchedSpotIndicator: _getTouchedSpotIndicator,
                              touchTooltipData: LineTouchTooltipData(
                                  getTooltipItems: _getTooltipItems,
                                  tooltipBgColor: const Color(0xFF2D2D2D),
                                  tooltipRoundedRadius: 15,
                                  tooltipPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  tooltipBorder: null)),

                          // read about it in the LineChartData section
                          lineBarsData: [
                            // data 1
                            LineChartBarData(
                              dotData: FlDotData(
                                show: false,
                              ),
                              aboveBarData: BarAreaData(show: false),
                              barWidth: 1,
                              color: Colors.grey[400],
                              spots: controller.lastMonthUsage.entries
                                  .map((element) {
                                return FlSpot(element.key.toDouble(),
                                    element.value.yValue);
                              }).toList(),
                            ),
                            // data 2
                            LineChartBarData(
                              dotData: FlDotData(
                                show: false,
                              ),
                              aboveBarData: BarAreaData(show: false),
                              barWidth: 1,
                              color: colorTheme.primary,
                              belowBarData: BarAreaData(
                                show: true,
                                color: colorTheme.primary.withOpacity(0.2),
                              ),
                              spots: controller.thisMonthUsage.entries
                                  .map((element) {
                                return FlSpot(element.key.toDouble(),
                                    element.value.yValue);
                              }).toList(),
                            ),

                            // data 3
                            LineChartBarData(
                                dotData: FlDotData(
                                  show: false,
                                ),
                                aboveBarData: BarAreaData(show: false),
                                barWidth: 1,
                                color: colorTheme.secondaryContainer,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: colorTheme.primary.withOpacity(0.2),
                                ),
                                spots: controller.predictedUsage.entries
                                    .map((element) {
                                  return FlSpot(element.key.toDouble(),
                                      element.value.yValue);
                                }).toList()),
                          ]),
                      swapAnimationDuration:
                          const Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear, // Optional
                    ),
                  ),
                ),
              ),
            ],
          ));
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    if (value <= 0 || value > 31) {
      return const Text("");
    }

    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );

    DateFormat formatterByDay = DateFormat('d일');
    DateTime date =
        DateTime.parse(controller.lastMonthUsage[value.toInt()]!.xValue);
    Widget text;
    text = Text('${formatterByDay.format(date)}', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  List<LineTooltipItem?> _getTooltipItems(List<LineBarSpot> touchedBarSpots) {
    return touchedBarSpots.map((barSpot) {
      final flSpot = barSpot;

      // 이번달이랑 예측에서 겹치는 부분이면 이번달 사용량 그래프의 tooltip null
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
        usageTextStyle = const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        );
      } else if (barSpot.barIndex == 1) {
        usageTextStyle = const TextStyle(
          color: LightColors.yellow1,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
      } else {
        usageTextStyle = const TextStyle(
          color: Color.fromARGB(255, 154, 154, 255),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
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
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: flSpot.y.toStringAsFixed(1),
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

  List<TouchedSpotIndicatorData?> _getTouchedSpotIndicator(
      LineChartBarData barData, List<int> spotIndexes) {
    return spotIndexes.map((spotIndex) {
      final spot = barData.spots[spotIndex];

      Color spotIndicatorColor;
      // 어떤 선인지 y값으로 확인
      if (controller.thisMonthUsage.keys.contains(spotIndex) &&
          spot.y == controller.thisMonthUsage[spotIndex]!.yValue) {
        spotIndicatorColor = LightColors.yellow1;
      } else if (controller.predictedUsage.keys
              .contains(spotIndex + controller.thisMonthUsage.keys.length) &&
          spot.y ==
              controller
                  .predictedUsage[
                      spotIndex + controller.thisMonthUsage.keys.length]!
                  .yValue) {
        spotIndicatorColor = LightColors.purple;
      } else {
        spotIndicatorColor = Colors.grey[400]!;
      }

      return TouchedSpotIndicatorData(
        FlLine(color: Color(0xFFCBCBCB), strokeWidth: 1, dashArray: [3, 3]),
        FlDotData(
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 5,
              color: Colors.white,
              strokeWidth: 1,
              strokeColor: spotIndicatorColor,
            );
          },
        ),
      );
    }).toList();
  }
}
