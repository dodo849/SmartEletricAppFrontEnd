import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/MyBackButtonIcon.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/EnterUserInfoViewModel.dart';

class CustomerValidationCheck extends StatelessWidget {
  const CustomerValidationCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EnterUserInfoViewModel.to.checkCustomerValidation();
    print("실행!!!!");

    // 테마 스타일
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: const MyBackButtonIcon(),
            onPressed: () {
              Get.back();
            }),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "이용가능 고객인지 확인중입니다",
                style: textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Lottie.asset('assets/lottie/loading.json', width: 10),
            ]),
      ),
    );
    ;
  }
}
