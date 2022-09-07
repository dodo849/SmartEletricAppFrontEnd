import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/UnderlineTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterCustomerInfoViewModel.dart';

class EnterCustomerNumber extends StatelessWidget {
  const EnterCustomerNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// ViewModel dependency injection


    /// 본문 텍스트 스타일 정의
    var bodyTextStyle = TextStyle(
        color: context.theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.normal);

    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 30),
        // decoration: BoxDecoration(
        //   color: context.theme.colorScheme.background,
        // ),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Text("고객번호를 입력해주세요", style: textTheme.headline1),
        UnderlineTextInput(
          focusLineColor: colorTheme.secondaryContainer,
          textInputType: TextInputType.number,
          onChanged: (text) {
            EnterCustomerInfoViewModel.to.customerNumber(text);
          },
        ),
      ],
    ));
  }
}
