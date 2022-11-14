import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AiReportViewModel.dart';

class NightTypeCard extends StatelessWidget {
  const NightTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Define theme
    var colorTheme = context.theme.colorScheme;

    // Text style
    var titleStyle = TextStyle(
        color: colorTheme.onPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold);
    var bodyStyle = TextStyle(
        color: colorTheme.onPrimary,
        fontSize: 14,
        fontWeight: FontWeight.normal);

    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF332D41).withOpacity(0.9)),
        child: Stack(
          children: [
            // 이미지
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/night.png", width: 70),
              ],
            ),

            // 글
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AiReportViewModel.to.user.value.name}님의 ",
                  style: titleStyle,
                ),
                SizedBox(height: 5),
                Text(
                  "주 전기 사용시간",
                  style: titleStyle,
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '밤 사용량',
                    style: TextStyle(
                        color: colorTheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '이 ',
                        style: TextStyle(
                          color: colorTheme.onPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '전체 사용량의 ${(AiReportViewModel.to.aiReport.value.nightTimePowerUsage / 
                            (AiReportViewModel.to.aiReport.value.dayTimePowerUsage + 
                            AiReportViewModel.to.aiReport.value.nightTimePowerUsage) * 100).toStringAsFixed(0)}%',
                      ),
                      TextSpan(
                        text: '입니다!',
                        style: TextStyle(
                          color: colorTheme.onPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "대기전력 사용이 많",
                  style: bodyStyle,
                ),
                SizedBox(height: 20),
                RoundedButton(
                    text: "대기전력 의심 제품 알아보기",
                    bgColor: Color(0xFF332D41),
                    textColor: Colors.white,
                    size: ButtonSize.large,
                    action: () {}),
              ],
            ),
          ],
        ));
  }
}
