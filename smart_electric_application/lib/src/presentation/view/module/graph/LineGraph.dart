import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';

class LineGraphViewModel extends GetxController {
  // static BarGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxDouble maxBarHeight = 0.0.obs;
  RxDouble barWidth = 0.0.obs;
  RxDouble barGap = 0.0.obs;

  // Graph mock data
  List<GraphPointModel> mockData = <GraphPointModel>[];

  // UseCase

  @override
  void onInit() async {
    // Create mock data
    for (int i = 0; i < 100; i += 5) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      mockData.add(GraphPointModel("$i일", yValue));
      print("mockData");
    }

    scrollController.value.addListener(() {
      print("### scroll value ${scrollController.value.offset}");
      print("### first bar pos: ${scrollController.value.offset ~/ 27}");
      setMaxBarHeight();
    });

    super.onInit();
  }

  void setMaxBarHeight() {
    // 첫번째 Bar 위치
    var firstBarOnScreen = scrollController.value.offset ~/ 27;
    // 화면에 한번에 들어온 바 개수
    var barNumberOnScreenTemp = 10; // #### 계산필요
    // 화면에 들어온 바 데이터 자르기
    var start = firstBarOnScreen;
    var end = firstBarOnScreen + barNumberOnScreenTemp;
    if (start < 0) start = 0;
    if (end > mockData.length) end = mockData.length;
    var subList = mockData.sublist(start, end);
    // 최댓값 구하기
    var maxBarHeightPrimitive =
        [...subList].map((e) => e.yValue).fold<double>(0.0, max).round();
    // y축 조정 (20은 라벨 감안한 여분 값)
    maxBarHeight(maxBarHeightPrimitive + 20);
    print(maxBarHeightPrimitive);
  }
}

class LineGraph extends GetView<LineGraphViewModel> {
  const LineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1200,
        height: 300,
        child: CustomPaint(
          // child: Container(),
          painter: LineGraphPainter(),
        ),
      ),
    );
  }
}

class LineGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var background = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..isAntiAlias = true;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (var i = 0; i < 5; i++) {
      final tp = TextPainter(
        text: TextSpan(
          text: '메롱',
          style: const TextStyle(fontSize: 12),
        ),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(10, size.height - 10 - i * (size.height / 5.0)));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
