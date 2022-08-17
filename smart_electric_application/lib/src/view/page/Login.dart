import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/view/atoms/TextInput.dart';
import 'package:smart_electric_application/src/view/module/common/MyBottomNavigationBar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
        foregroundColor: context.theme.colorScheme.background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // id input
              TextInput(
                labelText: "ID",
                placeholder: "아이디를 입력해주세요",
              ),
              SizedBox(height: 25),
              // password input
              TextInput(
                labelText: "PW",
                placeholder: "비밀번호를 입력해주세요",
              ),
              SizedBox(height: 25),

              // login button
              RoundedBoutton(
                  text: "로그인하기",
                  color: context.theme.colorScheme.primary,
                  size: ButtonSize.large,
                  action: () {}),
              SizedBox(height: 15),

              // signup button
              RoundedBoutton(
                  text: "회원가입하기",
                  color: context.theme.colorScheme.secondary,
                  size: ButtonSize.large,
                  action: () {})
            ],
          )),
      // bottomNavigationBar: MyBottomNavgationBar(),
    );
  }
}
