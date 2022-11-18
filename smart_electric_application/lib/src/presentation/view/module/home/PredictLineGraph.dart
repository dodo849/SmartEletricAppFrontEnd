import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
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
                  minX: controller.minX.value,
                  maxX: controller.maxX.value,
                  maxY: controller.maxY.value,
                  showingTooltipIndicators: [],
                  titlesData: FlTitlesData(
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      // minWidth: 200,
                      maxWidth: 1000,
                    ),
                    child: LineChart(
                      LineChartData(
                          minX: controller.minX.value,
                          maxX: controller.maxX.value,
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
                                  top: BorderSide(color: colorTheme.outline),
                                  bottom: BorderSide(
                                      color: colorTheme.outline, width: 2))),
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false,
                          ),
                          // clipData: FlClipData.all(),

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
                                // print(element.key);
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
                                // print(element.key);
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
                                  // print(element.key);
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
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    text = Text('${value.toInt()}일', style: style);

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
      if (spotIndex < controller.predictedUsage.length &&
          spot.y == controller.predictedUsage[spotIndex]!.yValue) {
        spotIndicatorColor = LightColors.purple;
      } else if (spotIndex < controller.thisMonthUsage.length &&
          spot.y == controller.thisMonthUsage[spotIndex]!.yValue) {
        spotIndicatorColor = LightColors.yellow1;
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
