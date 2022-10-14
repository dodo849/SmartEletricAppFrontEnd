import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';

class PredictLineGraphViewModel extends GetxController {
  RxDouble minX = 0.0.obs;
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
              controller.minX(0);
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
                  if (nextRightMinX > 0 && nextRightMaxX < 100) {
                    controller.minX(nextRightMinX);
                    controller.maxX(nextRightMaxX);
                  }
                } else {
                  if (nextLeftMinX > 0 && nextLeftMaxX < 100) {
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
                      rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                                                bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),),),
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
                      color: colorTheme.secondary,
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
                        FlSpot(1, 0),
                        FlSpot(1, 34),
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

   Widget bottomTitleWidgets(double value, TitleMeta meta) {
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
}
