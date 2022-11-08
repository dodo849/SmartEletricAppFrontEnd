import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ImageButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/ai_report/AiReportBarGraph.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/AnlaysisBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/SavingTipProductTypeGrid.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/ShowPreviousUsageCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/TestChart.dart';
import 'package:smart_electric_application/src/presentation/view/page/PreviousUsage.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("create");
    return SingleChildScrollView(
      child: Column(
        children: [
          //section 1
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 전력분석 배너 (title + image)
                SizedBox(height: 25),
                AnlaysisBanner(),
                SizedBox(height: 30),

                // 어제 사용량 그래프
                Container(
                  width: double.infinity, height: 300,
                  child: AiReportBarGraph()),
                SizedBox(height: 30),

                // 이전 사용량 보기 버튼
                GestureDetector(
                  onTap: (){
                    Get.to(PreviousUsage());
                  },
                  child: ShowPreviousUsageCard()),
              ],
            ),
          ),
          SizedBox(height: 30),
          Divider(thickness: 10, color: context.theme.colorScheme.surface),
          SizedBox(height: 30),
          //section 2
          Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("절약 방법", style: context.theme.textTheme.headline3),

                  // AI 추천 절약 방법 버튼
                  ImagedButton(
                      imagePath: "assets/images/avatar_woman_phone.png",
                      color: context.theme.colorScheme.primary,
                      text: "AI 추천 절약 방법 보기",
                      action: () {
                        print("image button tap");
                      }),
                  SizedBox(height: 30),

                  // 절약 팁 분류 목록
                  SavingTipProductTypeGrid(),
                ],
              )),
        ],
      ),
    );
  }
}
