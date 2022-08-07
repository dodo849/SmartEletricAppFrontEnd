import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressiveIntervalBar extends StatelessWidget {
  const ProgressiveIntervalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            children: [
              // 피커
              SvgPicture.asset(
                'assets/icons/picker-current-green-light.svg',
                // color: context.theme.colorScheme.background,
              ),
            ],
          ),

          SizedBox(height: 5),

          // 누진구간 bar
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        height: 10,
                        width: 100,
                        decoration: BoxDecoration(
                            color: context.theme.colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                    SizedBox(height: 5),
                    Text("0~200 kWh",
                        style: TextStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    Container(
                        height: 10,
                        // width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFBF1A),
                        )),
                    SizedBox(height: 5),
                    Text("200~400 kWh",
                        style: TextStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    Container(
                        height: 10,
                        // width: 100,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF5D5D),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                    SizedBox(height: 5),
                    Text("400~ kWh",
                        style: TextStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget getCurrentPickerWidget(ko) {
  //                 if (isLightTheme) {
  //                   Get.changeThemeMode(ThemeMode.dark);
  //                   isLightTheme = false;
  //                 } else {
  //                   Get.changeThemeMode(ThemeMode.light);
  //                   isLightTheme = true;
  //                 }
  // }
}
