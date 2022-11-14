import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

class EnterCustomerNumber extends StatelessWidget {
  const EnterCustomerNumber({Key? key}) : super(key: key);

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

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Text("고객번호를 입력해주세요", style: textTheme.headline1),
        SizedBox(height: 20),
        CustomTextInput(
            focusColor: colorTheme.primary,
            textInputStyle: TextInputStyle.underline,
            textInputType: TextInputType.number,
            placeholder: "10자리 고객번호 입력",
            maxLength: 10,
            isFocus: true,
            onChanged: (value) {
              EnterUserInfoViewModel.to.customerNumber(value);
              validate(value);
            }),
        SizedBox(height: 30),
        Text("고객번호는 전기요금고지서, 혹은 한전 전화문의로 확인하실 수 있습니다.",
            style: textTheme.bodyText2),
      ],
    ));
  }

  ///유효성 검사: 첫번째 문항 - 고객번호 10자리
  void validate(value) {
    // 10자리 고객번호
    if (EnterUserInfoViewModel.to.customerNumber.value.length == 10) {
      // button 활성화
      EnterUserInfoViewModel.to.isButtonEnable(true);
    } else {
      // button 비활성화
      EnterUserInfoViewModel.to.isButtonEnable(false);
    }
  }
}
