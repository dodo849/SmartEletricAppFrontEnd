import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/module/previous_usage/PreviousUsageBarGraph.dart';
import 'package:smart_electric_application/src/presentation/view/module/previous_usage/PreviousUsageSummaryCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/previous_usage/SelectPeriodBar.dart';
import 'package:smart_electric_application/src/presentation/view/module/previous_usage/UsageUnitsSelectButtons.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PreviousUsageViewModel.dart';

class PreviousUsage extends GetView<PreviousUsageViewModel> {
  const PreviousUsage({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(PreviousUsageViewModel());

    // Define theme
    var colorTheme = context.theme.colorScheme;

    return Obx(()=>Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        title: const Text('이전 사용량'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorTheme.onBackground,
            fontSize: 18,
            fontFamily: "Pretendard"),
        foregroundColor: colorTheme.onBackground,
        shadowColor: Colors.transparent,
        backgroundColor: colorTheme.background,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UsageUnitsSelectButtons(),
                    SizedBox(height: 20),
                    SelectPeriodBar(),
                    SizedBox(height: 30),
                    PreviousUsageSummaryCard(),
                  ]),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: controller.maxY.value > 1.9 ? 20 : 20),
              child: PreviousUsageBarGraph()),
          ],
        ),
      ),
    ));
  }
}
