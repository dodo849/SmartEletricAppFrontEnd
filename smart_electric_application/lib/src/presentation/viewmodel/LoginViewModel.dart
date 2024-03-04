import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/CheckLoginUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/LoginUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';

class LoginViewModel extends GetxController {
  static LoginViewModel get to => Get.find();

  // Input variables
  RxString email = "".obs;
  RxString password = "".obs;

  // State variables
  RxBool isLogin = false.obs; // 로그인 상태이면 true

  // Use case
  var loginUseCase = LoginUsecase();
  var checkLoginUseCase = CheckLoginUsecase();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void login(BuildContext context) async {
    Result<dynamic, String> loginResult =
        await loginUseCase.execute(email.value, password.value);

    if (loginResult.status == ResultStatus.success) {
      Get.to(() => const RootScaffold(), transition: Transition.fadeIn);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              titlePadding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              contentPadding: EdgeInsets.all(30),
              title: Text("로그인 실패"),
              content: Text(loginResult.error!),
              actions: [
                TextButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void checkLogin() async {
    Result<bool, String> checkLoginResult = await checkLoginUseCase.execute();

    if (checkLoginResult.value == true) {
      isLogin(true);
    }
  }
}
