import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/MyBackButtonIcon.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EmailVerification.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterUserEmail.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterUserName.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterUserPassword.dart';
import 'package:smart_electric_application/src/presentation/view/page/first_access/CustomerValidationCheck.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterHouseholderName.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterCustomerNumber.dart';
import 'package:smart_electric_application/src/presentation/view/page/signup/EmailVerified.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

/// 고객정보 입력 페이지
class EnterCustomerInfo extends StatelessWidget {
  const EnterCustomerInfo({Key? key}) : super(key: key);

  // 고객정보 입력 하위 페이지들
  static final EnterPages = <Widget>[
    const EnterCustomerNumber(),
    const EnterHouseholderName(),
    const EnterUserName(),
    const EnterUserEmail(),
    const EnterUserPassword(),
    const EmailVerification(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Dependency injection
    // input 값 및 하위페이지 이동 관리
    Get.put(EnterUserInfoViewModel());

    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => GestureDetector(
          onTap: () {
            // 키보드 외부 터치 시 키보드 내림
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: colorTheme.background,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: const MyBackButtonIcon(),
                onPressed: () {
                  // 2번째 문항부터는 백버튼 클릭 시 이전 문항으로 돌아감
                  if (EnterUserInfoViewModel.to.idx.value > 0) {
                    print(EnterUserInfoViewModel.to.idx.value);
                    assert(EnterUserInfoViewModel.to.idx.value > 0,
                        "page index error");
                    EnterUserInfoViewModel.to.tempIdx--;
                  } else {
                    // 첫번째 문항에선 처음화면으로 back
                    Get.back();
                  }
                },
              ),
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(color: colorTheme.background),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  // 하위 페이지 + 애니메이션
                  AnimatedOpacity(
                      opacity: EnterUserInfoViewModel.to.viewOpacity.value,
                      duration: const Duration(milliseconds: 200),
                      child: EnterPages[EnterUserInfoViewModel.to.idx.value]),

                  Spacer(),

                  // 키보드 위에 다음으로 floating 버튼
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                    child: RoundedButton(
                        text: "다음으로",
                        bgColor: EnterUserInfoViewModel.to.isButtonEnable.value
                            ? colorTheme.secondaryContainer
                            : colorTheme.surface,
                        textColor:
                            EnterUserInfoViewModel.to.isButtonEnable.value
                                ? colorTheme.onPrimary
                                : colorTheme.onSurface,
                        size: ButtonSize.large,
                        action: () => buttonAction()),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }

  void buttonAction() {
    if (EnterUserInfoViewModel.to.isButtonEnable.value == true) {
      switch (EnterUserInfoViewModel.to.tempIdx.value) {
        // 비밀번호 입력 페이지에서 다음 버튼 클릭 시 이메일 인증 전송
        case 4:
          EnterUserInfoViewModel.to.signup(); // 아직 가입 Exception 처리 X
          EnterUserInfoViewModel.to.sendEmailVerification();
          break;
        case 5:
          EnterUserInfoViewModel.to.checkEmailVerification();
          break;
        default:
          // 버튼 disabled
          EnterUserInfoViewModel.to.isButtonEnable(false);
      }

      // 페이지 이동
      EnterUserInfoViewModel.to.tempIdx++;
    }
  }
}
