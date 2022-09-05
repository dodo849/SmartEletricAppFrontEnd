import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class BarGraphViewModel extends GetxController {
  // static BarGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxDouble maxBarHeight = 60.0.obs;
  RxDouble barWidth = 7.0.obs;
  RxDouble barGap = 10.0.obs;

  // Graph mock data
  List datas = <double>[
    20,
    30,
    10,
    20,
    23,
    32,
    5,
    23,
    43,
    12,
    32,
    23,
    0,
    4,
    2,
    100,
    20,
    50
  ];

  @override
  void onInit() {
    scrollController.value.addListener(() {
      print("### scroll value ${scrollController.value.offset}");
      print("### first bar pos: ${scrollController.value.offset ~/ 27}");
      setMaxBarHeight();
    });

    super.onInit();
  }

  void setMaxBarHeight() {
    var firstBarOnScreen = scrollController.value.offset ~/ 27;
    var subList = datas.sublist(firstBarOnScreen, firstBarOnScreen + 13);
    var maxBarHeightPrimitive = [...subList]
        .reduce((value, element) => value > element ? value : element);
    maxBarHeight(maxBarHeightPrimitive);
    print(maxBarHeightPrimitive);
  }
}

class BarGraph extends GetView<BarGraphViewModel> {
  const BarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Viewmodel dependency injection
    Get.put(BarGraphViewModel());

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
    double yHeight = graphHeight / 6;
    double xWidth = 20;

    return Obx(() => SizedBox(
          height: 300,
          child: Stack(children: [
            // layer 1 : y axis
            Container(
              child: Column(children: [
                for (int i = 0; i < 6; i++) ...[
                  Row(
                    children: [
                      Text("${i}"),
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
            Container(
                child: ListView(
              controller: controller.scrollController.value,
              scrollDirection: Axis.horizontal,
              children: [
                for (var data in controller.datas) ...[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: controller.barGap.value),
                    decoration: BoxDecoration(
                        // color: context.theme.colorScheme.secondary,
                        ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        // margin: EdgeInsets.only(top: data),
                        height: (300 / controller.maxBarHeight.value * data),
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
                    ),
                  ),
                ],
              ],
            ))
          ]),
        ));
  }
}
