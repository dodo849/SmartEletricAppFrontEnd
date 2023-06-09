import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

import '../../atoms/BorderedTextInput.dart';

class EnterUserPassword extends StatelessWidget {
  const EnterUserPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("비밀번호를 입력해주세요", style: textTheme.headline1),
            SizedBox(height: 20),
            CustomTextInput(
              focusColor: colorTheme.primary,
              textInputType: TextInputType.visiblePassword,
              textInputStyle: TextInputStyle.underline,
              isFocus: true,
              isObscureText: true,
              errorText: EnterUserInfoViewModel.to.inputError.value
                  ? EnterUserInfoViewModel.to.errorMessage.value
                  : null,
              onChanged: (value) {
                EnterUserInfoViewModel.to.password(value);
                validate(value);
              },
            ),
            SizedBox(height: 30),
            Text("비밀번호는 8자리 이상이며, 특수문자를 포함해야합니다.",
                style: textTheme.bodyText2),
          ],
        )));
  }

  ///유효성 검사: 비밀번호
  void validate(value) {
    if (value.length != 0) {
      // button 활성화
      EnterUserInfoViewModel.to.isButtonEnable(true);
    } else {
      // button 비활성화
      EnterUserInfoViewModel.to.isButtonEnable(false);
    }
  }
}
