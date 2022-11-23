import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/EnterUserInfoPage.dart';

class CheckPassword extends StatelessWidget {
  const CheckPassword({Key? key}) : super(key: key);

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
            const SizedBox(height: 50),
            Text("비밀번호를 다시한번 입력해주세요", style: textTheme.headline1),
            const SizedBox(height: 20),
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
                EnterUserInfoViewModel.to.checkPassword(value);
                EnterUserInfoViewModel.to.inputError(false);
              },
            ),
          ],
        )));
  }
}
