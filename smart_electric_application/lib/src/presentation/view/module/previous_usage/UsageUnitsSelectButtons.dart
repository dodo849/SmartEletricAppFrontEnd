import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PreviousUsageViewModel.dart';

/// 사용량 단위 설정 버튼
class UsageUnitsSelectButtons extends GetView<PreviousUsageViewModel> {
  const UsageUnitsSelectButtons({super.key});

  @override
  Widget build(BuildContext context) {

    // Define theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
          width: double.infinity,
          child: Row(children: [
            ...controller.dateUnitButtonText.asMap().entries.map((element) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      for (int i = 0;
                          i < controller.dateUnitToggleButtons.length;
                          i++) {
                        controller.dateUnitToggleButtons[i] = i == element.key;
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.dateUnitToggleButtons[element.key]
                                ? colorTheme.surface
                                : colorTheme.background),
                        child: Text(element.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: controller
                                        .dateUnitToggleButtons[element.key]
                                    ? colorTheme.onBackground
                                    : colorTheme.onSurface))),
                  ),
                )),
          ]),
        ));
  }
}
