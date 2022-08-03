import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "AI 분석 리포트 보기",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/arrow.svg',
                      width: 10,
                      height: 10,
                      color: context.theme.colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
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
