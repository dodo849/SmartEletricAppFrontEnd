import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Themes.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AiReportViewModel.dart';

class AiReportBarGraphViewModel extends GetxController {
  RxDouble minX = 1.0.obs;
  RxDouble maxX = 30.0.obs;

  RxDouble minY = 0.0.obs;
  RxDouble maxY = 100.0.obs;

  List<GraphPointModel> lastMonthUsage = <GraphPointModel>[];
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
    FlSpot(7, 65),
    FlSpot(8, 68),
    FlSpot(9, 70),
    FlSpot(10, 72),
    FlSpot(11, 74),
    FlSpot(12, 78),
    FlSpot(13, 80),
    FlSpot(14, 82),
    FlSpot(15, 90),
  ];

  @override
  void onInit() async {
    // Create mock data
    for (int i = 1; i < 101; i += 5) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      lastMonthUsage.add(GraphPointModel("$i시", yValue));
    }

    maxX(lastMonthUsage.length.toDouble());
    super.onInit();
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

    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
                minWidth: 200,
                maxWidth: 400,
              ),
        child: BarChart(
              BarChartData(
                // minX: controller.minX.value,
                // maxX: controller.maxX.value,
                maxY: controller.maxY.value,
                // showingTooltipIndicators: [],
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                        bottom: BorderSide(color: colorTheme.outline, width: 2))),
                gridData: FlGridData(
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                        color: colorTheme.outline,
                        strokeWidth: 1,
                        dashArray: [1, 0])),
                // clipData: FlClipData.all(),
                // Set tooltip
                barTouchData: BarTouchData(
                    // getTouchedSpotIndicator: _getTouchedSpotIndicator,
                    touchTooltipData: BarTouchTooltipData(
                        // getTooltipItems: _getTooltipItems,
                        tooltipBgColor: const Color(0xFF2D2D2D),
                        tooltipRoundedRadius: 15,
                        tooltipPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        tooltipBorder: null)),
                // read about it in the LineChartData section
                barGroups:
                    // data 1
                    controller.lastMonthUsage.asMap().entries.map((element) {
                  return BarChartGroupData(
                    x: element.key.toInt(),
                    barRods: [
                      BarChartRodData(
                        color: _getBarColor(context, element.key.toInt()),
                        toY: element.value.yValue,
                        width: 6,
                      ),
                    ],
                    // showingTooltipIndicators: [0],
                  );
                }).toList(),
      
                // LineChartBarData(
                //   dotData: FlDotData(
                //     show: false,
                //   ),
                //   aboveBarData: BarAreaData(show: false),
                //   barWidth: 1,
                //   color: Colors.grey[400],
                //   spots: controller.lastMonthUsage
                //       .asMap()
                //       .entries
                //       .map((element) {
                //     // print(element.key);
                //     return FlSpot(
                //         element.key.toDouble(), element.value.yValue);
                //   }).toList(),
                // ),
              ),
              swapAnimationDuration: const Duration(milliseconds: 150), // Optional
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
    text = Text('${value.toInt()}시', style: style);

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

  Color? _getBarColor(BuildContext context, int xValue) {
    var colorTheme = context.theme.colorScheme;

    /// 0~23시를 6등분해서 나눠놓은거고 0은 0~4시, 5는 20~24시입니다.
    /// 전력 사용량 기준 내림차순으로 정렬되어 있습니다.
    List<int> timePeriodIndex =
        AiReportViewModel.to.aiReport.value.timePeriodIndex;

    if (timePeriodIndex[0] * 4 < xValue &&
        xValue <= timePeriodIndex[0] * 4 + 4) {
      return colorTheme.primary;
    } else {
      return colorTheme.surfaceVariant;
    }
  }
}
