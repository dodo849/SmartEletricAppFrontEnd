import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';

class PredictLineGraphViewModel extends GetxController {
  RxDouble minX = 1.0.obs;
  RxDouble maxX = 30.0.obs;

  RxDouble minY = 0.0.obs;
  RxDouble maxY = 100.0.obs;

  List<GraphPointModel> data = <GraphPointModel>[];

  @override
  void onInit() async {
    // Create mock data
    for (int i = 1; i < 101; i += 10) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      data.add(GraphPointModel("$i일", yValue));
    }

    maxX(data.length.toDouble());
    super.onInit();
  }
}

class PredictLineGraph extends GetView<PredictLineGraphViewModel> {
  const PredictLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(PredictLineGraphViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Listener(
          onPointerSignal: (signal) {
            if (signal is PointerScrollEvent) {
              if (signal.scrollDelta.dy.isNegative) {
                controller
                    .minX(controller.maxX.value + controller.maxX.value * 0.05);
                controller
                    .maxX(controller.maxX.value - controller.maxX.value * 0.05);
              } else {
                controller
                    .minX(controller.minX.value - controller.maxX.value * 0.05);
                controller
                    .maxX(controller.maxX.value + controller.maxX.value * 0.05);
              }
            }
          },
          child: GestureDetector(
            onDoubleTap: () {
              controller.minX(1);
              controller.maxX(controller.data.length.toDouble());
            },
            onHorizontalDragUpdate: (dragUpdDet) {
              double primDelta = dragUpdDet.primaryDelta ?? 0.0;

              var nextRightMinX =
                  controller.minX.value + controller.maxX.value * 0.015;
              var nextRightMaxX =
                  controller.maxX.value + controller.maxX.value * 0.015;
              var nextLeftMinX =
                  controller.minX.value - controller.maxX.value * 0.015;
              var nextLeftMaxX =
                  controller.maxX.value - controller.maxX.value * 0.015;

              if (primDelta != 0) {
                if (primDelta.isNegative) {
                  if (nextRightMinX > 1 && nextRightMaxX < 100) {
                    controller.minX(nextRightMinX);
                    controller.maxX(nextRightMaxX);
                  }
                } else {
                  if (nextLeftMinX > 1 && nextLeftMaxX < 100) {
                    controller.minX(nextLeftMinX);
                    controller.maxX(nextLeftMaxX);
                  }
                }
              }
            },
            child: LineChart(
              LineChartData(
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
                        getTitlesWidget: _bottomTitleWidgets,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                      border: Border(
                          top: BorderSide(color: colorTheme.outline),
                          bottom:
                              BorderSide(color: colorTheme.outline, width: 2))),
                  gridData: FlGridData(
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                          color: colorTheme.outline,
                          strokeWidth: 1,
                          dashArray: [1, 0])),
                  clipData: FlClipData.all(),
                  // Set tooltip
                  lineTouchData: LineTouchData(
                      getTouchedSpotIndicator: _getTouchedSpotIndicator,
                      touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: _getTooltipItems,
                          tooltipBgColor: const Color(0xFF2D2D2D),
                          tooltipRoundedRadius: 15,
                          tooltipPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                      color: colorTheme.onSurface,
                      spots: controller.data.asMap().entries.map((element) {
                        // print(element.key);
                        return FlSpot(
                            element.key.toDouble(), element.value.yValue);
                      }).toList(),
                    ),
                    // data 2
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
                      spots: const [
                        FlSpot(7, 65),
                        FlSpot(9, 68),
                        FlSpot(10, 70),
                        FlSpot(11, 74),
                        FlSpot(12, 78),
                        FlSpot(13, 80),
                        FlSpot(14, 82),
                        FlSpot(15, 90),
                      ],
                    ),
                    // data 3
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
                      spots: const [
                        // FlSpot(0, 0),
                        FlSpot(1, 0),
                        FlSpot(2, 40),
                        FlSpot(3, 50),
                        FlSpot(4, 51),
                        FlSpot(5, 58),
                        FlSpot(6, 62),
                        FlSpot(7, 65),
                      ],
                    ),
                  ]),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
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
      if (flSpot.x == 0 || flSpot.x == 6) {
        return null;
      }

      TextAlign textAlign = TextAlign.left;
      // switch (flSpot.x.toInt()) {
      //   case 1:
      //     textAlign = TextAlign.left;
      //     break;
      //   case 5:
      //     textAlign = TextAlign.right;
      //     break;
      //   default:
      //     textAlign = TextAlign.center;
      // }

      return LineTooltipItem(
        '',
        // '${flSpot.x.toInt()}일 \n',
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: [
          const TextSpan(
            text: '지난달 사용량\n',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: flSpot.y.toString(),
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'kWh',
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
      if (spot.x == 0 || spot.x == 6) {
        return null;
      }
      return TouchedSpotIndicatorData(
        FlLine(color: Color(0xFFCBCBCB), strokeWidth: 0.5, dashArray: [3, 3]),
        FlDotData(
          getDotPainter: (spot, percent, barData, index) {
            if (index < 7) {
              return FlDotCirclePainter(
                radius: 5,
                color: Colors.white,
                strokeWidth: 1,
                strokeColor: Color(0xFFFECB54),
              );
            } else {
              return FlDotCirclePainter(
                radius: 5,
                color: Colors.white,
                strokeWidth: 1,
                strokeColor: Color(0xFF6D6CE7),
              );
            }
          },
        ),
      );
    }).toList();
  }
}
