import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterCustomerName.dart';
import 'package:smart_electric_application/src/presentation/view/module/first_access/EnterCustomerNumber.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterCustomerInfoViewModel.dart';

class EnterCustomerInfo extends StatelessWidget {
  const EnterCustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dependency injection
    Get.put(EnterCustomerInfoViewModel());

    var EnterPages = <Widget>[
      const EnterCustomerNumber(),
      const EnterCustomerName(),
    ];

    // 본문 텍스트 스타일 정의
    var bodyTextStyle = TextStyle(
        color: context.theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
        fontWeight: FontWeight.normal);

    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: context.theme.colorScheme.onSurface),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(seconds: 3),
                      child: EnterPages[EnterCustomerInfoViewModel.to.idx.value]),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                    child: RoundedBoutton(
                        text: "다음으로",
                        bgColor:
                            EnterCustomerInfoViewModel.to.isTextFieldEmpty.value
                                ? colorTheme.surface
                                : colorTheme.secondaryContainer,
                        textColor:
                            EnterCustomerInfoViewModel.to.isTextFieldEmpty.value
                                ? colorTheme.onSurface
                                : colorTheme.onPrimary,
                        size: ButtonSize.large,
                        action: () {
                          // Get.to(() => EnterCustomerName(),
                          //     transition: Transition.cupertino);
                        }),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
