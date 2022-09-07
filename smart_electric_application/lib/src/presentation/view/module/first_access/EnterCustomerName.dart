import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterCustomerInfoViewModel.dart';

import '../../atoms/BorderedTextInput.dart';

class EnterCustomerName extends StatelessWidget {
  const EnterCustomerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Text("성함을 입력해주세요", style: textTheme.headline1),
        SizedBox(height: 20),
        CustomTextInput(
          focusColor: colorTheme.secondaryContainer,
          textInputType: TextInputType.name,
          textInputStyle: TextInputStyle.underline,
          isFocus: true,
          onChanged: (value) {
            EnterCustomerInfoViewModel.to.customerName(value);
            validate(value);
          },
        ),
      ],
    ));
  }

  ///유효성 검사: 두번째 문항 - 성함 입력여부만 확인
  void validate(value) {
    if (value.length != 0) {
      // button 활성화
      EnterCustomerInfoViewModel.to.isButtonEnable(true);
    } else {
      // button 비활성화
      EnterCustomerInfoViewModel.to.isButtonEnable(false);
    }
  }
}
