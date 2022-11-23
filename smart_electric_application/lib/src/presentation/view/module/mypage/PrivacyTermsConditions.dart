import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyTermsConditions extends StatelessWidget {
  const PrivacyTermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;
    var textStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: colorTheme.onSurface.withOpacity(0.8),
        height: 1.5);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: colorTheme.outline)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RichText(
          text: TextSpan(
              text:
                  "Team Kapple은 「개인정보보호법」에 의거하여, 아래와 같은 내용으로 개인정보를 수집하고 있습니다.\n",
              style: textStyle,
              children: [
                // TextSpan(text: "Ⅰ. 개인정보의 수집 및 이용 동의서\n"),
                TextSpan(
                    text:
                        "이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.\n\n"),
                TextSpan(text: "① 개인정보 수집 항목\n"),
                TextSpan(text: "가) 수집 항목 (필수항목)\n"),
                TextSpan(
                    text:
                        "- 성명(국문), 이메일, 한국전력공사 고객번호, 전력 사용량 정보 제공일로부터 1년 간의 데이터\n"),
                TextSpan(text: "- 이 외 고유식별정보나 민감정보를 수집하지 않음\n"),
                TextSpan(text: "나) 수집 및 이용 목적\n"),
                TextSpan(text: "- 실시간 전력 사용량/요금 서비스 제공\n"),
                TextSpan(text: "- 전력 사용량 예측 AI 서비스 제공\n"),
                TextSpan(text: "② 개인정보 보유 및 이용기간\n"),
                TextSpan(
                    text: " - 최소 1년, 최대 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지\n"),
                TextSpan(text: "③ 동의거부관리\n"),
                TextSpan(
                    text:
                        " - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 서비스 이용에 있어 불이익이 발생할 수 있음을 알려드립니다.\n"),
              ]),
        ),
      ]),
    );
  }
}
