import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/MyBackButtonIcon.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/CheckPassword.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/CheckIsSmartMeter.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EmailVerification.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserEmail.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserName.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserPassword.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterCustomerNumber.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/EnterUserInfoPage.dart';

/// 고객정보 입력 페이지
class EnterUserInfo extends StatelessWidget {
  const EnterUserInfo({Key? key}) : super(key: key);

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
                onPressed: () => EnterUserInfoViewModel.to.backButtonAction(),
              ),
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(color: colorTheme.background),
                padding: EnterUserInfoViewModel.to.isWebView.isTrue
                    ? const EdgeInsets.symmetric(horizontal: 0)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Stack(children: [
                  // 하위 페이지 + 애니메이션
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                          opacity: EnterUserInfoViewModel.to.viewOpacity.value,
                          duration: const Duration(milliseconds: 200),
                          child: EnterUserInfoPage
                              .values[EnterUserInfoViewModel.to.idx.value]
                              .page),
                      const Spacer(),
                    ],
                  ),
                        
                  // 키보드 위에 다음으로 floating 버튼
                  Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 20,
                            left: EnterUserInfoViewModel.to.isWebView.isTrue
                                ? 30
                                : 0,
                            right: EnterUserInfoViewModel.to.isWebView.isTrue
                                ? 30
                                : 0),
                        child: RoundedButton(
                            text: EnterUserInfoViewModel.to.buttonText.value,
                            bgColor:
                                EnterUserInfoViewModel.to.isButtonEnable.value
                                    ? colorTheme.primary
                                    : colorTheme.surface,
                            textColor:
                                EnterUserInfoViewModel.to.isButtonEnable.value
                                    ? colorTheme.onBackground
                                    : colorTheme.onSurface,
                            size: ButtonSize.large,
                            action: () => EnterUserInfoViewModel.to
                                .nextButtonAction(context)),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
