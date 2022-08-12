import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_electric_application/src/view/page/AIReport.dart';

class EstimatedChargeCard extends StatelessWidget {
  const EstimatedChargeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "53,120";
    var bodyValue = "325 kWh";
    var bodyDetailValue = "12";

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "이번달 예상 요금",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
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
                          color: context.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/arrow.svg',
                      width: 14,
                      height: 14,
                      color: context.theme.colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${dataValue}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "원 / ${bodyValue}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
