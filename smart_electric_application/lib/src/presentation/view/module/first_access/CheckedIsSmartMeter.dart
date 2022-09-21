import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

import '../../atoms/BorderedTextInput.dart';

class CheckedIsSmartMeter extends StatelessWidget {
  const CheckedIsSmartMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100),
        if (EnterUserInfoViewModel.to.isSmartMeter?.value == true) ... [
          Text("스마트 계량기 이용가능 고객이십니다. 다음으로 버튼을 눌러주세요."),
        ],
        Text(
          "스마트계량기 이용가능 고객인지 확인중입니다",
          style: textTheme.bodyText1,
        ),
        SizedBox(height: 20),
        Container(
          width: 100,
          height: 40,
          child: Lottie.asset(
            'assets/lottie/loading.json',
            fit: BoxFit.fill,
          ),
        ),
      ],
    ));
  }
}
