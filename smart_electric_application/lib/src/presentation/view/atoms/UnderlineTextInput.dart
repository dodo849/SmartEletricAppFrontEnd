import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// label과 placeholder를 설정할 수  있는 컴포넌트
class UnderlineTextInput extends StatelessWidget {
  const UnderlineTextInput({
    Key? key,
    this.labelText,
    this.placeholder,
    this.focusLineColor,
    this.textInputType,
    this.maxLength,
    required this.onChanged,
  }) : super(key: key);

  // 부모 컴포넌트에게 값을 받을 클래스 변수 정의
  final String? labelText;
  final String? placeholder;
  final Color? focusLineColor;
  final TextInputType? textInputType;
  final int? maxLength;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 라벨 값이 있으면 Text() 넣기
        if (labelText != null) ...[
          Text(
            "$labelText",
            style: TextStyle(color: context.theme.colorScheme.onSurface),
          )
        ],

        // 플레이스홀더 값에 따라 TextField 반환
        getTextFieldIsPlaceholder(placeholder, context, controller),
      ]),
    );
  }

  Widget getTextFieldIsPlaceholder(String? placeholder, BuildContext context,
      TextEditingController controller) {
    // 아웃라인 스타일 정의 (focus & enabled)
    var focusBorderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
          color: focusLineColor ?? context.theme.colorScheme.primary,
          width: 2,
          style: BorderStyle.solid),
    );
    var enabledBorderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
          color: context.theme.colorScheme.outline,
          width: 2,
          style: BorderStyle.solid),
    );

    // 입력 시 텍스트 스타일 정의
    var textStyle = TextStyle(color: context.theme.colorScheme.onBackground);

    // 텍스트 필드 정의
    var textField = TextField(
      controller: controller,
      style: textStyle,
      keyboardType: textInputType ?? TextInputType.none,
      maxLength: maxLength,
      decoration: InputDecoration(
          hintText: placeholder ?? " ",
          hintStyle: TextStyle(color: context.theme.colorScheme.surfaceVariant),
          focusedBorder: focusBorderStyle,
          enabledBorder: enabledBorderStyle),
      onChanged: (text) {
        onChanged(text);
      },
    );

    return textField;
  }
}
