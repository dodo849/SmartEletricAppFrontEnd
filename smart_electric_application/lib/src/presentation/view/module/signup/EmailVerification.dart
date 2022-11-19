import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "이메일로 인증 링크를 \n보내드렸습니다",
              style: textTheme.headline1!.copyWith(height: 1.3),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "링크를 통해 인증 완료 후 다음 버튼을 눌러주세요",
              style: textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15,),
            if (EnterUserInfoViewModel.to.isEmailVerificationError.value) ...[
              Text(
                EnterUserInfoViewModel.to.emailVerificationErrorMessage.value,
                style: TextStyle(color: colorTheme.error, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        )));
  }
}
