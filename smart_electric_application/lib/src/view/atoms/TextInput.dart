import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

// label과 placeholder를 선택해 지정 가능한 컴포넌트

class TextInput extends StatelessWidget {
  const TextInput({Key? key, this.labelText, this.placeholder})
      : super(key: key);

  // 부모 컴포넌트에게 값을 받을 클래스 변수 정의
  final String? labelText;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 라벨 값이 있으면 Text() 넣기
        if (labelText != null) ...[
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "$labelText",
                style: TextStyle(color: context.theme.colorScheme.onSurface),
              ))
        ],

        SizedBox(height: 10),

        // 플레이스홀더 값에 따라 TextField 반환
        getTextFieldIsPlaceholder(placeholder, context),
      ]),
    );
  }

  Widget getTextFieldIsPlaceholder(String? placeholder, BuildContext context) {
    // 아웃라인 스타일 정의
    var focusBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(
          color: context.theme.colorScheme.primary,
          width: 1,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20.0),
    );
    var enabledBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(
          color: context.theme.colorScheme.outline,
          width: 1,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20.0),
    );

    // 텍스트 스타일 정의
    var textStyle = TextStyle(color: context.theme.colorScheme.onSurface);

    // 반환할 TextField
    var textField = TextField(
      style: textStyle,
      decoration: InputDecoration(
          focusedBorder: focusBorderStyle, enabledBorder: enabledBorderStyle),
    );

    // 플레이스 홀더 설정이 있으면 설정된 TextField 반환
    if (placeholder != null) {
      textField = TextField(
          style: textStyle,
          decoration: InputDecoration(
              hintText: "$placeholder",
              focusedBorder: focusBorderStyle,
              enabledBorder: enabledBorderStyle));
    }

    return textField;
  }
}
