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

    return Obx(() => Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            getContent(textTheme),
            const SizedBox(height: 20),
          ],
        )));
  }

  Widget getContent(TextTheme textTheme) {
    // 로딩중이면
    if (EnterUserInfoViewModel.to.isSmartMeterLoad.value == false) {
      return Container(
          child: Column(
        children: [
          Text("이용 가능 고객인지 확인중 입니다.", style: textTheme.bodyText1),
          // 로딩 애니메이션 로티
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

    // 로딩 완료 시
    // 스마트 계량기 이면
    if (EnterUserInfoViewModel.to.isSmartMeter.value == true) {
      return Column(children: [
        Row(
          children: [
            Text("스마트 계량기", style: textTheme.headline1),
            SizedBox(width: 10),
            Text("이용가능 고객이십니다", style: textTheme.bodyText1),
          ],
        ),
        SizedBox(height: 10),
        Text("다음으로 버튼을 눌러주세요.", style: textTheme.bodyText1),
      ]);

      // 일반 계량기 이면
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("일반 계량기", style: textTheme.headline1),
              SizedBox(width: 5),
              Text("이용 고객이십니다", style: textTheme.bodyText1),
            ],
          ),
          SizedBox(height: 10),
          Text(
              "실시간 기능은 이용하실 수 없지만 \n월 단위 청구정보를 확인하실 수 있습니다. \n계속하시려면 다음 버튼을 눌러주세요.",
              style: textTheme.bodyText1?.copyWith(height: 1.5)),
        ],
      );
    }
  }
}
