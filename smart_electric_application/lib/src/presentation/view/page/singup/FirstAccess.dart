import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/page/Home.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/view/page/singup/EnterUserInfo.dart';

class FirstAccess extends StatelessWidget {
  const FirstAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return GestureDetector(
      onTap: () {
        // 키보드 외부 터치 시 키보드 내림
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.background,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text("안녕하세요 :)", style: textTheme.headline1),
                  SizedBox(height: 7),
                  Text("스마트전기앱이 처음이신가요?", style: textTheme.headline1),
                  SizedBox(height: 30),
                  RoundedButton(
                      text: "서비스 가입하기",
                      bgColor: colorTheme.secondaryContainer.withOpacity(0.2),
                      textColor: colorTheme.secondaryContainer,
                      size: ButtonSize.large,
                      action: () {
                        Get.to(() => EnterUserInfo(),
                            transition: Transition.rightToLeftWithFade);
                      }),
                  SizedBox(height: 40),
                  Text("가입하신적이 있나요?", style: textTheme.bodyText1),
                  SizedBox(height: 15),
                  RoundedButton(
                      text: "로그인하기",
                      bgColor: colorTheme.surface,
                      textColor: colorTheme.secondaryContainer,
                      size: ButtonSize.large,
                      action: () {
                        Get.to(() => RootScaffold(),
                            transition: Transition.fade);
                      }),
                  SizedBox(height: 10),
                ],
              ),
            )),
      ),
    );
  }
}
