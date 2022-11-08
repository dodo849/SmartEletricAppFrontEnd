import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PreviousUsageViewModel.dart';

class PreviousUsageSummaryCard extends GetView<PreviousUsageViewModel> {
  const PreviousUsageSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme
    var colorTheme = context.theme.colorScheme;

    return Obx(()=>Container(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "7월 1번째 주 사용량",
          style: TextStyle(
              color: colorTheme.onSurfaceVariant,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        // 사용량
        SizedBox(height: 5),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              "${controller.selectedPowerUsage.value}",
              style: TextStyle(
                  color: colorTheme.onBackground,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Text(
              "kWh",
              style: TextStyle(
                  color: colorTheme.onSurfaceVariant,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),

        // 통계치
        SizedBox(height: 20),
        // 최대 사용량
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "주간 최대 사용량",
              style:
                  TextStyle(fontSize: 14, color: colorTheme.onSurfaceVariant),
            ),
            Text(
              "10.8 kWh",
              style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.error,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        // 최소 사용량
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "주간 최소 사용량",
              style:
                  TextStyle(fontSize: 14, color: colorTheme.onSurfaceVariant),
            ),
            Text(
              "10.8 kWh",
              style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.tertiaryContainer,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        // 평균 사용량
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "주간 평균 사용량",
              style:
                  TextStyle(fontSize: 14, color: colorTheme.onSurfaceVariant),
            ),
            Text(
              "10.8 kWh",
              style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.primaryContainer,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ]),
    ));
  }
}
