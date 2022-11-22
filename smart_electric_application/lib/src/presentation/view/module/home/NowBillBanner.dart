import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/HomeViewModel.dart';

class NowBillBanner extends StatelessWidget {
  const NowBillBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define theme
    var colorTheme = context.theme.colorScheme;

    // 데이터
    var dataValue = "13,030";
    var bodyValue = "/ 125 kWh";

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "월드컵북로 501, 00동 0000호",
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${HomeViewModel.to.userName.value}님의 현재 요금",
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                // 납부정보
                HomeViewModel.to.user.value.billDate.length == 0
                    ? Container()
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: colorTheme.onSurface,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            color: colorTheme.background),
                        child: Text(
                          "매월 ${HomeViewModel.to.user.value.billDate}일 납부",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: colorTheme.onSurface),
                        ),
                        // HomeViewModel.to.user.value.billDate
                      )
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${HomeViewModel.to.billOfThisMonth.value}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "원 ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  "/ ${HomeViewModel.to.powerUsageOfThisMonthStr.value} kWh",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${HomeViewModel.to.progressiveSectionType.value.krString} 누진 구간",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            HomeViewModel.to.progressiveSectionType.value.color,
                      ),
                    ),
                    Text(
                      " 요금 적용",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            HomeViewModel.to.progressiveSectionType.value.color,
                      ),
                    ),
                  ],
                ),

                // 바그래프 설명
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getCurrentPickerCircleMini(),
                    SizedBox(width: 3),
                    Text("현재위치",
                        style: TextStyle(
                            color: colorTheme.onSurface, fontSize: 12)),
                    SizedBox(width: 6),
                    SvgPicture.asset(
                      'assets/icons/picker_circle_gray.svg',
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: 3),
                    Text("예상위치",
                        style: TextStyle(
                            color: colorTheme.onSurface, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget getCurrentPickerCircleMini() {
    var iconName = "assets/icons/picker_circle";

    if (HomeViewModel.to.progressiveSection.value == 0) {
      iconName += "_green";
    } else if (HomeViewModel.to.progressiveSection.value == 1) {
      iconName += "_yellow";
    } else {
      iconName += "_red";
    }

    iconName += ".svg";

    return SvgPicture.asset(
      iconName,
      width: 12,
      height: 12,
    );
  }
}
