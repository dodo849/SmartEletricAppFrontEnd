import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/login/LoginBanner.dart';
import 'package:smart_electric_application/src/presentation/view/page/first_access/EnterCustomerInfo.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/LoginViewModel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(LoginViewModel());

    return Scaffold(
        // appBar: EmptyAppBar(),
        body: Container(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.background,
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Spacer(),
                // 로고 + 문구
                LoginBanner(),
                SizedBox(height: 25),

                // id input
                CustomTextInput(
                    labelText: "이메일",
                    textInputStyle: TextInputStyle.bordered,
                    onChanged: (value) {
                      LoginViewModel.to.email(value);
                    }),
                SizedBox(height: 25),

                // password input
                CustomTextInput(
                    labelText: "비밀번호",
                    textInputStyle: TextInputStyle.bordered,
                    isObscureText: true,
                    onChanged: (value) {
                      LoginViewModel.to.password(value);
                    }),
                SizedBox(height: 25),

                // login button
                RoundedButton(
                    text: "로그인하기",
                    bgColor: context.theme.colorScheme.primary.withOpacity(0.2),
                    textColor: context.theme.colorScheme.primaryContainer,
                    size: ButtonSize.large,
                    action: () {
                      LoginViewModel.to.login(context);
                    }),
                SizedBox(height: 15),

                // signup button
                RoundedButton(
                    text: "회원가입하기",
                    bgColor:
                        context.theme.colorScheme.secondaryContainer.withOpacity(0.2),
                    textColor: context.theme.colorScheme.secondaryContainer,
                    size: ButtonSize.large,
                    action: () {
                      Get.to(EnterCustomerInfo());
                    }),

                Spacer(flex: 1),
              ],
            )));
  }
}
