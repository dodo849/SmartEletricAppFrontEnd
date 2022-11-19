import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';


/// ### 리팩토링 하고싶다.. 조건문 이상해...
class CheckIsSmartMeter extends StatelessWidget {
  const CheckIsSmartMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            _getContent(textTheme, colorTheme),
            const SizedBox(height: 20),
          ],
        )));
  }

  Widget _getContent(TextTheme textTheme, ColorScheme colorTheme) {
    // 로딩중이면
    if (EnterUserInfoViewModel.to.isSmartMeterLoad.value == false) {
      return Container(
          child: Column(
        children: [
          Text("이용 가능 고객인지 확인중 입니다.", style: textTheme.bodyText1),
          // 로딩 애니메이션 로티
          Container(
            width: 100,
            height: 40,
            child: Lottie.asset(
              'assets/lottie/loading.json',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ));
    } else {
      // 로딩 완료 시
      // 스마트 계량기 이면
      if (EnterUserInfoViewModel.to.isSmartMeter.value == true) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/check_circle.svg'),
                          SizedBox(height: 30),
              Text("스마트 계량기 이용 고객이십니다",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorTheme.onBackground)),
              SizedBox(height: 10),
              Text(
              "다음으로 버튼을 눌러주세요",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: colorTheme.onBackground,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 30),
              _getDescriptionUse(colorTheme),
            ]);

        // 일반 계량기 이면
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/check_circle.svg'),
            SizedBox(height: 30),
            Text("일반 계량기 이용 고객이십니다",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorTheme.onBackground)),
            SizedBox(height: 10),
            Text(
              "일반 계량기 고객 가입은 준비중입니다 :) \n조금만 기다려주세요",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: colorTheme.onBackground,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _getDescriptionUse(colorTheme),
          ],
        );
      }
    }
  }

  Widget _getDescriptionUse(ColorScheme colorTheme) {
    var textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: colorTheme.onSurface,
        height: 1.5);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorTheme.outline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("스마트 계량기 이용 고객", style: textStyle),
        SizedBox(height: 5),
        Text("· 1시간 단위 전력 사용량 확인 가능",
            style: textStyle.copyWith(fontWeight: FontWeight.normal)),
        SizedBox(height: 5),
        Text("· 전력 사용량 예측 기능 사용 가능",
            style: textStyle.copyWith(fontWeight: FontWeight.normal)),
        SizedBox(height: 5),
        SizedBox(height: 10),
        Text("일반 계량기 이용 고객", style: textStyle),
        SizedBox(height: 5),
        Text("· 한달 단위 납부정보 확인 가능",
            style: textStyle.copyWith(fontWeight: FontWeight.normal)),
      ]),
    );
  }
}
