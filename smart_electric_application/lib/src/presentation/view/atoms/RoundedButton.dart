import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonSize { small, midium, large }

class RoundedBoutton extends StatelessWidget {
  const RoundedBoutton(
      {Key? key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      required this.size,
      required this.action})
      : super(key: key);

  // 부모 컴포넌트에게 값을 받을 클래스 변수 정의
  final String text;
  final Color bgColor;
  final Color textColor;
  final ButtonSize size;
  final Function action;

  @override
  Widget build(BuildContext context) {
    // 아직 버튼 미디움, 스몰 사이즈 정의 못해서 assert
    assert(size == ButtonSize.large, "아직 midium, small은 사용할 수 없습니다.");

    // 둥근 버튼 스타일 정의
    final buttonStyle = ButtonStyle(
        minimumSize: MaterialStateProperty.all(getButtonSize(size)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        foregroundColor: MaterialStateProperty.all(textColor),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        )));


    return ElevatedButton(
        style: buttonStyle,
        onPressed: (){action();},
        child: Text(
          '$text',
          style: getTextStyleBySize(size),
        ));
  }

  // 버튼 사이즈 별로 크기 반환
  Size getButtonSize(ButtonSize size) {
    var returnSize;

    switch (size) {
      case ButtonSize.large:
        returnSize = Size(double.infinity, 50);
        break;
      case ButtonSize.midium: // 아직 미정
        break;
      case ButtonSize.small: // 아직 미정
        break;
    }
    return returnSize;
  }

  // 버튼 사이즈 별로 텍스트 스타일 반환
  TextStyle getTextStyleBySize(ButtonSize size) {
    var returnStyle;

    switch (size) {
      case ButtonSize.large:
        returnStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
        break;
      case ButtonSize.midium: // 미정
        break;
      case ButtonSize.small:
        returnStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
        break;
    }
    return returnStyle;
  }
}
