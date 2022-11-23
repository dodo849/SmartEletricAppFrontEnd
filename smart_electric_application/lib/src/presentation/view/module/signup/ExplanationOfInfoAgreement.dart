import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExplanationOfInfoAgreement extends StatelessWidget {
  const ExplanationOfInfoAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(height: 30),
        SvgPicture.asset("assets/icons/checklist_rectangle.svg"),
        const SizedBox(height: 30),
        Text(
          "마지막으로 다음 페이지를 참고하시어 \n한전 홈페이지를 통해 스마트전기앱에 \n정보제공동의를 해주세요",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorTheme.onBackground, height: 1.5),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
