import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';

class LineGraphViewModel extends GetxController {
  static LineGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  // 고민고민 fontsize같은건 거의 안변하니까 옵저빙할 필요 없는데 Rx를 꼭 써야하나??

  // Graph setting variables
  RxDouble graphHeight = 300.0.obs; // 그래프 높이
  RxDouble maxY = 0.0.obs; // data중에 최대 y 값

  // Y Axis variables
  RxInt yAxisLineNumber = 6.obs; // y축 선 개수
  RxDouble yAxisFontSize = 14.0.obs; // x축 라벨 글자 크기
  Rx<List<int>> yAxisLineValue = Rx<List<int>>([]); // y축 선 값들

  // X Axis variables
  RxDouble dotGap = 40.0.obs; // x축 점들 간격
  RxDouble xAxisFontSize = 14.0.obs; // x축 라벨 글자 크기
  RxDouble xAxisTopMargin = 20.0.obs; // x축이랑 그래프 사이

  // Graph mock data
  List<GraphPointModel> data = <GraphPointModel>[];

  // UseCase

  @override
  void onInit() async {
    // Create mock data
    for (int i = 0; i < 600; i += 10) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      data.add(GraphPointModel("$i일", yValue));
    }

    scrollController.value.addListener(() {
      print("### scroll value ${scrollController.value.offset}");
      print("### first bar pos: ${scrollController.value.offset ~/ 27}");

      // 최대 Y 값 다시 계산
      setmaxY();

      // 최대 Y 값에 따라 y축 선 값 다시 계산
      changeyAxisLine();
      print("yAxisLineValue ${yAxisLineValue.value}");
    });

    super.onInit();
  }

  void setmaxY() {
    // 첫번째 Bar 위치
    var firstBarOnScreen = scrollController.value.offset ~/ 27;
    // 화면에 한번에 들어온 바 개수
    var barNumberOnScreenTemp = 10; // #### 계산필요
    // 화면에 들어온 바 데이터 자르기
    var start = firstBarOnScreen;
    var end = firstBarOnScreen + barNumberOnScreenTemp;
    if (start < 0) start = 0;
    if (start >= data.length) start = data.length - 1;
    if (end >= data.length) end = data.length - 1;
    var subList = data.sublist(start, end);
    // 최댓값 구하기
    var maxYPrimitive =
        [...subList].map((e) => e.yValue).fold<double>(0.0, max).round();
    // y축 조정 (20은 라벨 감안한 여분 값)
    maxY(maxYPrimitive + 20);
    print("maxY ${maxY.value}");
  }

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  void changeyAxisLine() {
    var k = maxY.value ~/ 25;
    var maxLineValue = 25 * (k + 1);

    yAxisLineValue.value.clear();
    for (var i = 0; i < yAxisLineNumber.value; i++) {
      // var lineValue = maxY.value / yAxisLineNumber.value * i;

      var lineValue = maxLineValue / 5 * i;

      yAxisLineValue.value.add(lineValue.toInt());
    }
    var yAxisLineValueReversed = yAxisLineValue.value.reversed;
    yAxisLineValue(yAxisLineValueReversed.toList());
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
            Column(
              children: [
                // y축이랑 그래프 위치 맞추기 위한 height
                // 폰트 반만큼만 밑으로 내리기 -> but..1픽셀 안맞네 왜지?
                // SizedBox(height: LineGraphViewModel.to.yAxisFontSize.value / 2),
                Row(
                  children: [
                    // y축이랑 그래프 좌우 간격 띄우는 Width
                    const SizedBox(width: 30),

                    // 나머지 공간에 대해 그래프 채우기
                    Expanded(
                      child: SingleChildScrollView(
                        controller:
                            LineGraphViewModel.to.scrollController.value,
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
                              data: LineGraphViewModel.to.data,
                              yAxisLineValue:
                                  LineGraphViewModel.to.yAxisLineValue.value,
                              lineColor: colorTheme.primary,
                              dotGap: LineGraphViewModel.to.dotGap.value,
                              graphHeight:
                                  LineGraphViewModel.to.graphHeight.value,
                              maxY: LineGraphViewModel.to.maxY.value,
                              xAxisFontSize:
                                  LineGraphViewModel.to.xAxisFontSize.value,
                              xAxisTopMargin:
                                  LineGraphViewModel.to.xAxisTopMargin.value,
                              yAxisFontSize:
                                  LineGraphViewModel.to.yAxisFontSize.value,
                              yAxisLineNumber:
                                  LineGraphViewModel.to.yAxisLineNumber.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
        // 위 아래 라벨 사이즈때문에 divider가 좀 내려오므로 폰트사이즈로 보완
        height: LineGraphViewModel.to.graphHeight.value -
            LineGraphViewModel.to.yAxisFontSize.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // @deprecated
            // for (var i = LineGraphViewModel.to.maxY.value.toInt();
            //     i > ;
            //     i -= (LineGraphViewModel.to.maxY.value ~/
            //         LineGraphViewModel.to.yAxisLineNumber.value)) ...[
            for (var line in LineGraphViewModel.to.yAxisLineValue.value) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('$line',
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
  LineGraphPainter({
    required this.data,
    required this.yAxisLineValue,
    this.lineColor = Colors.black,
    this.graphHeight = 300.0,
    required this.maxY, // 이것도 data들어오면 자동으로 계산되게 하고 싶은데...
    this.dotGap = 40.0,
    this.xAxisFontSize = 14.0,
    this.xAxisTopMargin = 20.0,
    this.yAxisLineNumber = 6,
    this.yAxisFontSize = 14.0,
  });

  List<GraphPointModel> data;

  final Color lineColor;

  double graphHeight; // 그래프 높이
  double maxY; // 최대 y 크기

  double dotGap; // x축 점들 간격
  double xAxisFontSize; // x축 라벨 글자 크기
  double xAxisTopMargin; // x축이랑 그래프 사이

  int yAxisLineNumber; // y축 개수
  double yAxisFontSize; // y축 라벨 글자 크기
  List<int> yAxisLineValue; // y축 선 값들

  @override
  void paint(Canvas canvas, Size size) {
    // Draw dot
    for (var i = 0; i < data.length; i++) {
      var circlePaint = Paint()
        ..style = PaintingStyle.fill
        ..color = lineColor
        ..isAntiAlias = true
        ..strokeWidth = 2;

      // y축 최댓값
      var yLineMax = yAxisLineValue[yAxisLineNumber - 1];
      print("yAxisLineValue ${yAxisLineValue}");

      // Dot position
      var xValue = dotGap * i;
      var yValue = graphHeight -
          (graphHeight / (yLineMax + yAxisFontSize / 2) * data[i].yValue);
      print("yAxisFontSize ${yAxisFontSize}");
      print("data[i].yValue ${data[i].yValue}");
      print("yValue: ${yValue}");
      // var yValue = graphHeight - (graphHeight / maxY * data[i].yValue);

      // #. Draw dot
      const circleRadius = 4.0;
      var circlePosition = Offset(xValue + dotGap, yValue);
      canvas.drawCircle(circlePosition, circleRadius, circlePaint);

      // Next dot position
      if (i != data.length - 1) {
        var nextXValue = dotGap * (i + 1);
        var nextYValue = graphHeight -
            (graphHeight / (yLineMax + yAxisFontSize / 2) * data[i + 1].yValue);
        // var nextYValue =
        //     graphHeight - (graphHeight / maxY * data[i + 1].yValue);
        var nextCirclePostion = Offset(nextXValue + dotGap, nextYValue);

        canvas.drawLine(circlePosition, nextCirclePostion, circlePaint);
      }

      // X axis label
      var xAxisText = data[i].xValue;
      _drawText(
          canvas,
          xValue + dotGap,
          graphHeight - xAxisFontSize + xAxisTopMargin,
          "${xAxisText}",
          TextStyle(fontSize: xAxisFontSize, color: const Color(0xFF767676)));
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
