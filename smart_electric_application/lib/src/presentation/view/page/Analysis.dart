import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomActionButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ImageButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/AnlaysisBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/SavingTipProductTypeGrid.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/ShowPreviousUsageCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/analysis/YesterdayUsageBarGraph.dart';
import 'package:smart_electric_application/src/presentation/view/page/PreviousUsage.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AnalysisViewModel.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(AnalysisViewModel());

    // Theme
    var textTheme = context.theme.textTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          //section 1
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 전력분석 배너 (title + image)
                SizedBox(height: 35),
                AnlaysisBanner(),
                SizedBox(height: 35),

                // 어제 사용량 그래프
                Text(
                  "어제 사용량",
                  style: textTheme.headline3,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 220,
              child: YesterdayUsageBarGraph()),
          SizedBox(height: 30),
          // 이전 사용량 보기 버튼
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: GestureDetector(
                onTap: () {
                  Get.to(PreviousUsage());
                },
                child: ShowPreviousUsageCard()),
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
                      bgColor: context.theme.colorScheme.primary,
                      fgColor: context.theme.colorScheme.primaryContainer,
                      text: "AI 추천 절약 방법 보기",
                      action: () {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                                  title: "준비중",
                                  content: "컨텐츠 준비중입니다. \n다음 업데이트를 기대해주세요:)",
                                  actionButtons: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomActionButton(
                                          text: "확인",
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                      }),
                  SizedBox(height: 30),

                  // 절약 팁 분류 목록
                  SavingTipProductTypeGrid(),
                  SizedBox(height: 50),
                ],
              )),
        ],
      ),
    );
  }
}
