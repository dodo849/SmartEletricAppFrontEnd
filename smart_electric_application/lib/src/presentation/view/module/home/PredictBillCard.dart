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

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.colorScheme.background,
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

            SizedBox(height: 10),

            // 예측 요금 정보
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

            SizedBox(height: 10),

            // 예측 누진구간 정보
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "두번째 누진 구간",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "적용 예정입니다",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
