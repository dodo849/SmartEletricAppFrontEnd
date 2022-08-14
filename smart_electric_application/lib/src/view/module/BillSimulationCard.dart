import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillSimulationCard extends StatelessWidget {
  const BillSimulationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "13,030";
    var bodyValue = "125 kWh";

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //title
            Text(
              "선택한 제품 구매 시 1년 총 요금",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onBackground,
              ),
            ),

            SizedBox(height: 5),

            // 총 예상 요금
            Text(
              "803,400",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: context.theme.colorScheme.secondary,
              ),
            ),

            SizedBox(height: 5),

            // 증가된 요금 계산
            Text(
              "182,239원 증가 ▲",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onSurface,
              ),
            ),

            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),

            // 월별 증가된 요금 계산
            Row(
              children: [
                Text(
                  "현재 월 예상 요금",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Text(
                  "53,120원",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "월별 예상 추가 요금",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Text(
                  "13,830원",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            // 월 합계
            Row(
              children: [
                Text(
                  "합계",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Spacer(),
                Text(
                  "66,950원",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
