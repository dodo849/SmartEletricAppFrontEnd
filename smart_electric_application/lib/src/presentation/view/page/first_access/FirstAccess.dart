import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/page/Home.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/view/page/first_access/EnterCustomerInfo.dart';

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
                  Text("안녕하세요,", style: textTheme.headline1),
                  SizedBox(height: 7),
                  Text("스마트전기앱이 처음이신가요?", style: textTheme.headline1),
                  SizedBox(height: 40),
                  Text("가입하기 전 먼저 확인해보세요", style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  RoundedButton(
                      text: "이용가능고객인지 확인하기",
                      bgColor: colorTheme.surface,
                      textColor: colorTheme.secondaryContainer,
                      size: ButtonSize.large,
                      action: () {
                        Get.to(() => EnterCustomerInfo(),
                            transition: Transition.rightToLeftWithFade);
                      }),
                  SizedBox(height: 30),
                  Text("바로 가입하실 수도 있어요", style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  RoundedButton(
                      text: "서비스 가입하기",
                      bgColor: colorTheme.secondaryContainer.withOpacity(0.2),
                      textColor: colorTheme.secondaryContainer,
                      size: ButtonSize.large,
                      action: () {}),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(height: 30),
                  Text("가입하신적이 있나요?", style: textTheme.bodyText1),
                  SizedBox(height: 10),
                  CustomTextInput(
                      placeholder: "고객번호 10자리를 입력해주세요",
                      textInputStyle: TextInputStyle.bordered,
                      focusColor: colorTheme.secondaryContainer,
                      onChanged: () {}),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                          onTap: () => Get.back(),
                          child: Text("시작하기", style: TextStyle(color: colorTheme.onSurface),)),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
