import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LightColors {

  // 싱글톤 패턴 구현 :
  // private constructor ( ._() ) 를 이용해 
  // 외부에서 인스턴스를 생성할 수 없도록 한다
  LightColors._() {
    // 클래스 최초 생성 시 초기화 코드    
  }

  // 첫 인스턴스 생성
  static final LightColors _instance = LightColors._();

  // 인스턴스가 생성되어있으면 생성되어있는 인스턴스를 반환한다
  factory LightColors() => _instance;


// color define -> key value 형식으로 바꾸면 접근이 더 쉬울 거 같은데??

  static Map<String, Color> _lightColors = <String, Color>{
    "basic" : Color(0xFFFFFF),
    "orange1" : Color(0xEB8C1C),
    "orange2" : Color(0xFFA842),
    "blue" : Color(0x3485FF),
    "gray1" : Color(0xF6F6F9),
    "gray2" : Color(0x000000),
    "gray3" : Color(0xEDEEF0),
    "gray4" : Color(0xDFE1E4),
    "gray5" : Color(0x4D4D4D),
    "gray6" : Color(0x767676),
    "important" : Color(0x000000)
  };
//   static Color _basic = Color(0xFFFFFF);
//   static Color _orange1 = Color(0xEB8C1C);
//   static Color _orange2 = Color(0xFFA842);
//   static Color _blue = Color(0x3485FF);
//   static Color _gray1 = Color(0xF6F6F9);
//   static Color _gray2 = Color(0x000000);
//   static Color _gray3 = Color(0xEDEEF0);
//   static Color _gray4 = Color(0xDFE1E4);
//   static Color _gray5 = Color(0x4D4D4D);
//   static Color _gray6 = Color(0x767676);
//   static Color _important = Color(0x000000);

// // gatter
//   Color get basic => _basic;
//   Color get orange1 => _orange1;
//   Color get orange2 => _orange2;
//   Color get blue => _blue;
//   Color get gray1 => _gray1;
//   Color get gray2 => _gray2;
//   Color get gray3 => _gray3;
//   Color get gray4 => _gray4;
//   Color get gray5 => _gray5;
//   Color get gray6 => _gray6;
//   Color get important => _important;

  Map<String, Color> get lightColors => _lightColors;

}

class DarkColors {

  // 싱글톤 패턴 구현 :
  // private constructor ( ._() ) 를 이용해 
  // 외부에서 인스턴스를 생성할 수 없도록 한다
  DarkColors._() {
    // 클래스 최초 생성 시 초기화 코드    
  }

  // 첫 인스턴스 생성
  static final DarkColors _instance = DarkColors._();

  // 인스턴스가 생성되어있으면 생성되어있는 인스턴스를 반환한다
  factory DarkColors() => _instance;

  // color define
  static Color _basic = Color(0xFFFFFF);
  static Color _orange1 = Color(0xEB8C1C);
  static Color _orange2 = Color(0xFFA842);
  static Color _blue = Color(0x3485FF);
  static Color _gray1 = Color(0xF6F6F9);
  static Color _gray2 = Color.fromARGB(0, 255, 117, 117);
  static Color _gray3 = Color(0xEDEEF0);
  static Color _gray4 = Color(0xDFE1E4);
  static Color _gray5 = Color(0x4D4D4D);
  static Color _gray6 = Color(0x767676);
  static Color _important = Color(0x000000);

// gatter
  Color get basic => _basic;
  Color get orange1 => _orange1; 
  Color get orange2 => _orange2;
  Color get blue => _blue;
  Color get gray1 => _gray1;
  Color get gray2 => _gray2;
  Color get gray3 => _gray3;
  Color get gray4 => _gray4;
  Color get gray5 => _gray5;
  Color get gray6 => _gray6;
  Color get important => _important;

}

// 모드 확인 후 light/dark 클래스에 있는 색 전달
class ModeColors {

  ModeColors._();

  static LightColors _lc = LightColors();
  static DarkColors _dc = DarkColors();

  static Color? getModeColor(String colorName) {

    if (Get.isDarkMode) {
      return _lc.lightColors[colorName];
    } else {
      return _dc.gray2;
    }

  }

}

class ColorMode extends GetxController {
  Color gray2 = ModeColors.getModeColor("gray2") as Color;

  void toggleMode() {
    Color gray2 = ModeColors.getModeColor("gray2") as Color;
    update();
  }
  
}