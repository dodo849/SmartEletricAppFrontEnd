
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupComplete extends StatelessWidget {
  const SignupComplete({super.key});

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
      width: double.infinity,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset('assets/icons/person_check.svg'),
            SizedBox(
              height: 30,
            ),
            Text(
              "회원가입이 완료되었습니다",
              style: textTheme.headline1!.copyWith(height: 1.3),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "링크를 통해 인증 완료 후\n다음 버튼을 눌러주세요",
              style: textTheme.bodyText1!.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}