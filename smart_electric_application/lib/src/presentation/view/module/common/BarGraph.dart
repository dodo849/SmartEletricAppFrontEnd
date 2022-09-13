import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class GraphPoint {
  GraphPoint(String xValue, double yValue) {
    this.xValue = xValue;
    this.yValue = yValue;
  }
  late String xValue;
  late double yValue;
}

class BarGraphViewModel extends GetxController {
  // static BarGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxDouble maxBarHeight = 60.0.obs;
  RxDouble barWidth = 7.0.obs;
  RxDouble barGap = 10.0.obs;

  // Graph mock data
  List<GraphPoint> mockData = <GraphPoint>[];

  @override
  void onInit() {
    // Create mock data
    for (int i = 0; i < 100; i += 5) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      mockData.add(GraphPoint("$i일", yValue));
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
    var barNumberOnScreenTemp = 10;
    // 화면에 들어온 바 데이터 자르기
    var start = firstBarOnScreen;
    var end = firstBarOnScreen + barNumberOnScreenTemp;
    if (start < 0) start = 0;
    if (end > mockData.length) end = mockData.length;
    var subList = mockData.sublist(start, end);
    // 최댓값 구하기
    var maxBarHeightPrimitive = [...subList].reduce(
        (value, element) => value.yValue > element.yValue ? value : element);
    // y축 조정 (20은 라벨 감안한 여분 값)
    maxBarHeight(maxBarHeightPrimitive.yValue + 20);
    print(maxBarHeightPrimitive);
  }
}

class BarGraph extends GetView<BarGraphViewModel> {
  const BarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Viewmodel dependency injection
    Get.put(BarGraphViewModel());

    // theme style define
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    // Viewmodel initialize
    var deviceWidth = MediaQuery.of(context).size.width;
    var contentWidth = deviceWidth - 60;
    var barUnitWidth =
        controller.barWidth.value + (controller.barGap.value * 2);
    var barNumberPerScreen =
        (contentWidth / barUnitWidth).toInt(); //화면 당 bar 개수
    print("화면 당 바 개수 ${barNumberPerScreen}");

    // Variable define
    double graphHeight = 300;
    double yHeight = graphHeight / 6 - 10;
    double xWidth = 20;

    return Obx(() => SizedBox(
          height: graphHeight,
          child: Stack(children: [
            // layer 1 : y axis
            Container(
              child: Column(children: [
                for (int i = controller.maxBarHeight.value.toInt();
                    i > 0;
                    i -= (controller.maxBarHeight.value ~/ 6)) ...[
                  Row(
                    children: [
                      Text(
                        "${i}",
                        style: TextStyle(
                            fontSize: 13, color: colorTheme.surfaceVariant),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.outline,
                        ),
                      )),
                      SizedBox(height: yHeight),
                    ],
                  ),
                ],
              ]),
            ),
            // layer 2 : x axis
            OverflowBox(
              alignment: Alignment.bottomCenter,
              maxHeight: graphHeight+500, //500은 overflow 임의값
                child: ListView(
                  controller: controller.scrollController.value,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var data in controller.mockData) ...[
                      GestureDetector(
                        onTap: () {
                          print(data.xValue);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: controller.barGap.value),
                          decoration: BoxDecoration(
                              // color: context.theme.colorScheme.secondary,
                              ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedContainer(
                                  // margin: EdgeInsets.only(top: data),
                                  height: (300 /
                                      controller.maxBarHeight.value *
                                      data.yValue),
                                  width: controller.barWidth.value,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // X Axis value
                                Text(
                                  "${data.xValue}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: colorTheme.onSurface),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ))
          ]),
        ));
  }
}
