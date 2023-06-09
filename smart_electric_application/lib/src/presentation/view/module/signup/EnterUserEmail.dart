import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

class EnterUserEmail extends StatelessWidget {
  const EnterUserEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 본문 텍스트 스타일 정의
    var bodyTextStyle = TextStyle(
        color: context.theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.normal);

    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text("이메일을 입력해주세요", style: textTheme.headline1),
            const SizedBox(height: 20),
            CustomTextInput(
                focusColor: colorTheme.primary,
                textInputStyle: TextInputStyle.underline,
                textInputType: TextInputType.emailAddress,
                placeholder: "smart@smarteletric.co.kr",
                isFocus: true,
                errorText: EnterUserInfoViewModel.to.inputError.isTrue ?
                    EnterUserInfoViewModel.to.errorMessage.value : null,
                onChanged: (value) {
                  EnterUserInfoViewModel.to.email(value);
                  validate(value);
                }),
            const SizedBox(height: 30),
          ],
        )));
  }

  ///유효성 검사: 세번째 문항 - 이메일
  void validate(value) {
    // 이메일 유효성 검사
    if (EmailValidator.validate(EnterUserInfoViewModel.to.email.value)) {
      // button 활성화
      EnterUserInfoViewModel.to.isButtonEnable(true);
    } else {
      // button 비활성화
      EnterUserInfoViewModel.to.isButtonEnable(false);
    }
  }
}
