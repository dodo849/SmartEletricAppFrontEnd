import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUseCase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/SignupViewModel.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

    // ViewModel instance
    var signupViewModel = SignupViewModel();

    // theme define
    var colorTheme = context.theme.colorScheme;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          Spacer(),
          Text("hihihihi"),
          CustomTextInput(
              placeholder: "이메일을 입력해주세요",
              textInputStyle: TextInputStyle.bordered,
              onChanged: (value) {
                signupViewModel.emailAddress(value);
                print("email: ${signupViewModel.emailAddress.value}");
              }),
          SizedBox(
            height: 40,
          ),
          CustomTextInput(
              placeholder: "비밀번호를 입력해주세요",
              textInputStyle: TextInputStyle.bordered,
              onChanged: (value) {
                signupViewModel.password(value);
                print("email: ${signupViewModel.password.value}");
              }),
          SizedBox(height: 40),
          RoundedButton(
              text: "회원가입하기",
              bgColor: colorTheme.primary,
              textColor: colorTheme.onBackground,
              size: ButtonSize.large,
              action: () {
                // signupViewModel.signup();
                signupViewModel.emailVerified();
              }),
          Spacer(flex: 2),
        ]),
      ),
    );
  }
}
