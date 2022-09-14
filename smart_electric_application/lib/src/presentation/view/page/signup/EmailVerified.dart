import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/page/Home.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/SignupViewModel.dart';

class EmailVerified extends StatelessWidget {
  const EmailVerified({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel instance
    var signupViewModel = SignupViewModel();

    // Theme define
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Text(
                "이메일로 인증 링크를 보내드렸습니다",
                style: textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              Text(
                "링크를 통해 인증 완료 후 다음 버튼을 눌러주세요",
                style: textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(onPressed: (){
                Get.toNamed('/');
              }, child: Text("다음으로")),
              Spacer(),
            ],
          )),
    );
  }
}
