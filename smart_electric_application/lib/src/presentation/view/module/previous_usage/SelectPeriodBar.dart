import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/PreviousUsageViewModel.dart';

class SelectPeriodBar extends GetView<PreviousUsageViewModel> {
  const SelectPeriodBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;
    return Obx(() => Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // 왼쪽 화살표 버튼
            GestureDetector(
              onTap: () {
                controller.subtractDate();
              },
              child: Container(
                width: 15,
                height: 20,
                child: SvgPicture.asset('assets/icons/arrow_left.svg',
                    width: 10, height: 10, color: colorTheme.onSurface),
              ),
            ),

            // 날짜 텍스트
            Text("${controller.displayPeriodBarText.value}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorTheme.onBackground)),

            // 오른쪽 화살표 버튼
            GestureDetector(
              onTap: controller.rightButtonDisabled.value
                  ? null
                  : () {
                      controller.addDate();
                    },
              child: Container(
                width: 15,
                height: 20,
                child: SvgPicture.asset('assets/icons/arrow_right.svg',
                    width: 10,
                    height: 10,
                    color: controller.rightButtonDisabled.value
                        ? colorTheme.outline
                        : colorTheme.onSurface),
              ),
            ),
          ]),
        ));
  }
}
