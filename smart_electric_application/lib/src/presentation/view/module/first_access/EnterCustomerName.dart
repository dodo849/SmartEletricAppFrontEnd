import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/UnderlineTextInput.dart';

import '../../atoms/BorderedTextInput.dart';

class EnterCustomerName extends StatelessWidget {
  const EnterCustomerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 본문 텍스트 스타일 정의
    var bodyTextStyle = TextStyle(
        color: context.theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.normal);

    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("성함을 입력해주세요", style: textTheme.headline1),
            UnderlineTextInput(
              focusLineColor: colorTheme.secondaryContainer,
              textInputType: TextInputType.name,
              onChanged: (text){},
            ),
          ],
        ));
  }
}
