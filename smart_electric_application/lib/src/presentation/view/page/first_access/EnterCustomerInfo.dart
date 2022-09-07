import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
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

    // 본문 텍스트 스타일 정의
    var bodyTextStyle = TextStyle(
        color: context.theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.normal);

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
                icon: Icon(Icons.arrow_back,
                    color: context.theme.colorScheme.onSurface),
                onPressed: () {
                  // 2번째 문항부터는 백버튼 클릭 시 이전 문항으로 돌아감
                  if (EnterCustomerInfoViewModel.to.idx > 0) {
                    EnterCustomerInfoViewModel.to.tempIdx--;
                  } else {
                    // 첫버째 문항에선 처음화면으로 back
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
      EnterCustomerInfoViewModel.to.tempIdx++;
    }
  }
}
