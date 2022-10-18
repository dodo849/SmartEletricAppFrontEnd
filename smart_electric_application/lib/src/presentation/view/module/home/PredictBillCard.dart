import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_electric_application/src/presentation/view/page/AiReport.dart';

class EstimatedBillCard extends StatelessWidget {
  const EstimatedBillCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "53,120";
    var bodyValue = "325 kWh";
    var bodyDetailValue = "12";

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorTheme.background,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 타이틀 / AI 분석 go to 버튼
            Row(
              children: [
                Text(
                  "이번달 예상 요금",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorTheme.onSurface,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/AIReport");
                      },
                      child: Text(
                        "AI 분석 리포트 보기",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: colorTheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/arrow.svg',
                      width: 14,
                      height: 14,
                      color: colorTheme.secondary,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 10),

            // 예측 요금 정보
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${dataValue}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colorTheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "원",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorTheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "/ ${bodyValue}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: colorTheme.onSurface,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // 예측 누진구간 정보
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: colorTheme.primary,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(width: 5),
                Text(
                  "두번째 누진 구간",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorTheme.onBackground,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "적용 예상",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colorTheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
