import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';

class LineGraphViewModel extends GetxController {
  static LineGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxDouble graphHeight = 300.0.obs; // 그래프 높이
  RxInt yAxisNumber = 6.obs; // y축 개수
  RxDouble yAxisFontSize = 14.0.obs; // x축 라벨 글자 크기

  RxDouble maxYValue = 0.0.obs; // 최대 y 크기
  RxDouble dotGap = 40.0.obs; // x축 점들 간격
  RxDouble xAxisFontSize = 14.0.obs; // x축 라벨 글자 크기
  RxDouble xAxisTopMargin = 20.0.obs;

  // Graph mock data
  List<GraphPointModel> data = <GraphPointModel>[];

  // UseCase

  @override
  void onInit() async {
    // Create mock data
    for (int i = 0; i < 100; i += 5) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      data.add(GraphPointModel("$i일", yValue));
    }

    scrollController.value.addListener(() {
      print("### scroll value ${scrollController.value.offset}");
      print("### first bar pos: ${scrollController.value.offset ~/ 27}");
      setmaxYValue();
    });

    super.onInit();
  }

  void setmaxYValue() {
    // 첫번째 Bar 위치
    var firstBarOnScreen = scrollController.value.offset ~/ 27;
    // 화면에 한번에 들어온 바 개수
    var barNumberOnScreenTemp = 10; // #### 계산필요
    // 화면에 들어온 바 데이터 자르기
    var start = firstBarOnScreen;
    var end = firstBarOnScreen + barNumberOnScreenTemp;
    if (start < 0) start = 0;
    if (end >= data.length) end = data.length - 1;
    var subList = data.sublist(start, end);
    // 최댓값 구하기
    var maxYValuePrimitive =
        [...subList].map((e) => e.yValue).fold<double>(0.0, max).round();
    // y축 조정 (20은 라벨 감안한 여분 값)
    maxYValue(maxYValuePrimitive + 20);
    print("maxYValue ${maxYValue.value}");
  }

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class LineGraph extends GetView<LineGraphViewModel> {
  const LineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LineGraphViewModel());

    // Define theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Stack(
          // alignment: Alignment.topLeft,
          children: [
            // 1. y label
            LineGraphYAxis(),

            // 2. line graph
            Row(
              children: [
                SizedBox(width: 30),
                Expanded(
                  child: SingleChildScrollView(
                    controller: LineGraphViewModel.to.scrollController.value,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: LineGraphViewModel.to.dotGap.value *
                          LineGraphViewModel.to.data.length,
                      // 기본 그래프 높이 + x축 라벨이랑 그래프 간격 + x축 라벨 폰트 높이
                      height: LineGraphViewModel.to.graphHeight.value +
                          LineGraphViewModel.to.xAxisTopMargin.value +
                          LineGraphViewModel.to.xAxisFontSize.value,
                      child: CustomPaint(
                        painter: LineGraphPainter(
                          lineColor: colorTheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}


class LineGraphYAxis extends StatelessWidget {
  const LineGraphYAxis({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;

    return Obx(() => SizedBox(
        // width: double.infinity,
        height: LineGraphViewModel.to.graphHeight.value - 30, // 30은 x축 여분값
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = LineGraphViewModel.to.maxYValue.value.toInt();
                i > 0;
                i -= (LineGraphViewModel.to.maxYValue.value ~/
                    LineGraphViewModel.to.yAxisNumber.value)) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('$i',
                      style: TextStyle(
                          fontSize: LineGraphViewModel.to.yAxisFontSize.value,
                          color: colorTheme.surfaceVariant)),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(height: 1, color: colorTheme.outline),
                  ),
                ],
              ),
            ],
          ],
        )));
  }
}

class LineGraphPainter extends CustomPainter {
  LineGraphPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    var graphHeight = LineGraphViewModel.to.graphHeight.value;

    // Draw dot
    for (var i = 1; i < LineGraphViewModel.to.data.length + 1; i++) {
      var circlePaint = Paint()
        ..style = PaintingStyle.fill
        ..color = lineColor
        ..isAntiAlias = true
        ..strokeWidth = 2;

      // Dot position
      var xValue = LineGraphViewModel.to.dotGap.value * i;
      var yValue = LineGraphViewModel.to.graphHeight.value -
          (LineGraphViewModel.to.graphHeight.value /
              LineGraphViewModel.to.maxYValue.value *
              LineGraphViewModel.to.data[i].yValue);

      // #. Draw dot
      const circleRadius = 1;
      var circlePosition = Offset(xValue, yValue);
      canvas.drawCircle(circlePosition, 4, circlePaint);

      // Next dot position
      if (i != LineGraphViewModel.to.data.length) {
        var nextXValue = LineGraphViewModel.to.dotGap.value * (i + 1);
        var nextYValue = LineGraphViewModel.to.graphHeight.value -
            (LineGraphViewModel.to.graphHeight.value /
                LineGraphViewModel.to.maxYValue.value *
                LineGraphViewModel.to.data[i + 1].yValue);
        var nextCirclePostion = Offset(nextXValue, nextYValue);

        canvas.drawLine(circlePosition, nextCirclePostion, circlePaint);
      }

      // X axis label
      var xAxisText = LineGraphViewModel.to.data[i].xValue;
      var xAxisTextSize = 14.0;
      var xAxisTopMargin = LineGraphViewModel.to.xAxisTopMargin.value;
      _drawText(
          canvas,
          xValue,
          graphHeight - xAxisTextSize + xAxisTopMargin,
          "${xAxisText}",
          TextStyle(fontSize: xAxisTextSize, color: const Color(0xFF767676)));
    }
  }

  void _drawText(Canvas canvas, centerX, centerY, text, style) {
    final textSpan = TextSpan(
      text: text,
      style: style,
    );

    final textPainter = TextPainter()
      ..text = textSpan
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();

    final xCenter = (centerX - textPainter.width / 2);
    final yCenter = (centerY - textPainter.height / 2);
    final offset = Offset(xCenter, yCenter);

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
