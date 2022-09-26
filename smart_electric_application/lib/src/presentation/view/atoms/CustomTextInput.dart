import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TextInputStyle { underline, bordered }

/// label과 placeholder를 설정할 수  있는 컴포넌트
class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    this.labelText,
    this.placeholder,
    this.textInputStyle,
    this.focusColor,
    this.textInputType,
    this.maxLength,
    this.isFocus,
    this.errorText,
    this.isObscureText,
    required this.onChanged,
  }) : super(key: key);

  // 부모 컴포넌트에게 값을 받을 클래스 변수 정의
  final String? labelText;
  final String? placeholder;
  final TextInputStyle? textInputStyle;
  final Color? focusColor;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? isFocus;
  final String? errorText;
  final bool? isObscureText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();

    // Theme define
    var colorTheme = context.theme.colorScheme;

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 라벨 값이 있으면 Text() 넣기
        if (labelText != null) ...[
          Text(
            "$labelText",
            style: TextStyle(color: colorTheme.onSurface),
          )
        ],

        // 플레이스홀더 값에 따라 TextField 반환
        getTextFieldIsPlaceholder(placeholder, context, controller),
      ]),
    );
  }

  Widget getTextFieldIsPlaceholder(String? placeholder, BuildContext context,
      TextEditingController controller) {
    // Theme define
    final colorTheme = context.theme.colorScheme;
    // 아웃라인 스타일 정의 (focus & enabled)
    var focusBorderStyle;
    var enabledBorderStyle;
    var errorBorderStyle;

    switch (textInputStyle) {
      case TextInputStyle.bordered:
        focusBorderStyle = OutlineInputBorder(
          borderSide: BorderSide(
              color: focusColor ?? colorTheme.primary,
              width: 1,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20.0),
        );
        enabledBorderStyle = OutlineInputBorder(
          borderSide: BorderSide(
              color: colorTheme.outline, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20.0),
        );
        errorBorderStyle = OutlineInputBorder(
          borderSide: BorderSide(
              color: colorTheme.error, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20.0),
        );
        break;
      case TextInputStyle.underline:
        focusBorderStyle = UnderlineInputBorder(
          borderSide: BorderSide(
              color: focusColor ?? colorTheme.primary,
              width: 2,
              style: BorderStyle.solid),
        );
        enabledBorderStyle = UnderlineInputBorder(
          borderSide: BorderSide(
              color: colorTheme.outline, width: 2, style: BorderStyle.solid),
        );
        errorBorderStyle = UnderlineInputBorder(
          borderSide: BorderSide(
              color: colorTheme.error, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20.0),
        );
        break;
    }

    // 입력 시 텍스트 스타일 정의
    var textStyle = TextStyle(color: colorTheme.onBackground);

    // 텍스트 필드 정의
    var textField = TextField(
      controller: controller,
      style: textStyle,
      keyboardType: textInputType ?? TextInputType.none,
      maxLength: maxLength,
      autofocus: isFocus ?? false,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(color: colorTheme.surfaceVariant),
        errorText: errorText,
        errorStyle: TextStyle(color: colorTheme.error, fontSize: 14),
        focusedBorder: focusBorderStyle,
        enabledBorder: enabledBorderStyle,
      ),
      onChanged: (text) {
        onChanged(text);
      },
    );

    return textField;
  }
}
