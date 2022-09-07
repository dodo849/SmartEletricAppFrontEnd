import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/MyBackButtonIcon.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/CustomerValidationCheck.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterCustomerName.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterCustomerNumber.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterCustomerInfoViewModel.dart';

/// 고객정보 입력 페이지
class EnterCustomerInfo extends StatelessWidget {
  const EnterCustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Dependency injection
    // input 값 및 하위페이지 이동 관리
    Get.put(EnterCustomerInfoViewModel());

    // 고객정보 입력 하위 페이지들
    var EnterPages = <Widget>[
      const EnterCustomerNumber(),
      const EnterCustomerName(),
    ];

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
                  if (EnterCustomerInfoViewModel.to.idx.value > 0) {
                    print(EnterCustomerInfoViewModel.to.idx.value );
                    assert(EnterCustomerInfoViewModel.to.idx.value > 0, "page index error");
                    EnterCustomerInfoViewModel.to.tempIdx--;
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
                      opacity: EnterCustomerInfoViewModel.to.viewOpacity.value,
                      duration: const Duration(milliseconds: 200),
                      child:
                          EnterPages[EnterCustomerInfoViewModel.to.idx.value]),

                  Spacer(),

                  // 키보드 위에 다음으로 floating 버튼
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                    child: RoundedButton(
                        text: "다음으로",
                        bgColor:
                            EnterCustomerInfoViewModel.to.isButtonEnable.value
                                ? colorTheme.secondaryContainer
                                : colorTheme.surface,
                        textColor:
                            EnterCustomerInfoViewModel.to.isButtonEnable.value
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
    if (EnterCustomerInfoViewModel.to.isButtonEnable.value == true) {
      if (EnterCustomerInfoViewModel.to.tempIdx < 1) {
        // 페이지 이동
        EnterCustomerInfoViewModel.to.tempIdx++;
        // 버튼 disabled
        EnterCustomerInfoViewModel.to.isButtonEnable(false);
      } else {
        Get.to(CustomerValidationCheck(), transition: Transition.rightToLeft);
      }
    }
  }
}
