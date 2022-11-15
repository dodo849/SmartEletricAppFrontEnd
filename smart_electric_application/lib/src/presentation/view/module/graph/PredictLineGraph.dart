import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionForGraphUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetRecentPowerUsageByDayUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';

class PredictLineGraphViewModel extends GetxController {
  // - Graph setting
  RxDouble minX = 1.0.obs;
  RxDouble maxX = 30.0.obs;

  RxDouble minY = 0.0.obs;
  RxDouble maxY = 100.0.obs;

  // - Data variables
  Map<int, GraphPointModel> lastMonthUsage = {0: GraphPointModel('0', 0)};
  List<FlSpot> thisMonthUsage = [
    FlSpot(1, 0),
    FlSpot(2, 40),
    FlSpot(3, 50),
    FlSpot(4, 51),
    FlSpot(5, 58),
    FlSpot(6, 62),
    FlSpot(7, 65),
  ];
  List<FlSpot> predictUsage = [
    FlSpot(1, 0),
  ];

  // - Presentation variables
  RxBool loading = true.obs;

  // - Usecase
  var getAiPredictionForGraphUsecase = GetAiPredictionForGraphUsecase();
  var getRecentPowerUsageByDayUsecase = GetRecentPowerUsageByDayUsecase();

  @override
  void onInit() async {
    await fetchRecentPowerUsageByDay();

    // maxX(lastMonthUsage.length.toDouble());
    maxX(31);

    loading(false);
    super.onInit();
  }

  // - Fetch function

  /// 지난달 데이터 및 이번달 오늘까지 데이터 불러오기
  Future<void> fetchRecentPowerUsageByDay() async {
    // 네트워킹
    Result<RecentPowerUsageByDayDTO, String> getRecentPowerUsageByDayResult =
        await getRecentPowerUsageByDayUsecase.execute();

    if (getRecentPowerUsageByDayResult.status == ResultStatus.error) {
      return;
    }

    // 지난달 데이터 누적 값 계산
    List<PowerUsageDTO> lastMonthUsageDTO =
        getRecentPowerUsageByDayResult.value!.secondLastMonth;
    List<GraphPointModel> lastMonthGraphPoints = lastMonthUsageDTO
        .map((element) =>
            GraphPointModel(element.dateTimeKr, element.powerUsageQuantity))
        .toList();
    // 누적값으로 변환
    lastMonthGraphPoints = cumulativeCalculation(lastMonthGraphPoints);
    // map으로 변환
    lastMonthUsage = lastMonthGraphPoints.asMap();

    return;
  }

  /// 예측 사용량 데이터 가져오기
  void fetchPredictedPowerUsageOfThisMonth() async {
    // 네트워킹
    Result<List<GraphPointModel>, String> getAiPredictionForGraphResult =
        await getAiPredictionForGraphUsecase.execute();

    if (getAiPredictionForGraphResult.status == ResultStatus.error) {
      return;
    }

    List<GraphPointModel> predictedPowerUsage =
        getAiPredictionForGraphResult.value!;
  }

  // - Formatting function
  String formattingDate(String targetDate) {
    DateTime targetDateString = DateTime.parse(targetDate);
    DateFormat formatter = DateFormat('d');
    return formatter.format(targetDateString);
  }

  List<GraphPointModel> cumulativeCalculation(List<GraphPointModel> points) {
    double accumulate = 0.0;

    for (var i = 0; i < points.length; i++) {
      accumulate += points[i].yValue;
      points[i].yValue = accumulate;
    }

    return points;
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

    return Obx(() => controller.loading.isTrue
        ? Container()
        : Listener(
            onPointerSignal: (signal) {
              if (signal is PointerScrollEvent) {
                if (signal.scrollDelta.dy.isNegative) {
                  controller.minX(
                      controller.maxX.value + controller.maxX.value * 0.05);
                  controller.maxX(
                      controller.maxX.value - controller.maxX.value * 0.05);
                } else {
                  controller.minX(
                      controller.minX.value - controller.maxX.value * 0.05);
                  controller.maxX(
                      controller.maxX.value + controller.maxX.value * 0.05);
                }
              }
            },
            child: GestureDetector(
              onDoubleTap: () {
                controller.minX(1);
                controller.maxX(controller.lastMonthUsage.length.toDouble());
              },
              onHorizontalDragUpdate: (dragUpdDet) {
                double primDelta = dragUpdDet.primaryDelta ?? 0.0;

                var nextRightMinX =
                    controller.minX.value + controller.maxX.value * 0.01;
                var nextRightMaxX =
                    controller.maxX.value + controller.maxX.value * 0.01;
                var nextLeftMinX =
                    controller.minX.value - controller.maxX.value * 0.01;
                var nextLeftMaxX =
                    controller.maxX.value - controller.maxX.value * 0.01;

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
                            bottom: BorderSide(
                                color: colorTheme.outline, width: 2))),
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
                        spots: controller.lastMonthUsage.entries.map((element) {
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
                          color: colorTheme.primary,
                          belowBarData: BarAreaData(
                            show: true,
                            color: colorTheme.primary.withOpacity(0.2),
                          ),
                          spots: controller.thisMonthUsage),

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
                          spots: controller.predictUsage),
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

  List<TouchedSpotIndicatorData?> _getTouchedSpotIndicator(
      LineChartBarData barData, List<int> spotIndexes) {
    return spotIndexes.map((spotIndex) {
      final spot = barData.spots[spotIndex];

      Color spotIndicatorColor;
      // 어떤 선인지 y값으로 확인
      if (spotIndex < controller.predictUsage.length &&
          spot.y == controller.predictUsage[spotIndex].y) {
        spotIndicatorColor = LightColors.purple;
      } else if (spotIndex < controller.thisMonthUsage.length &&
          spot.y == controller.thisMonthUsage[spotIndex].y) {
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
