import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/LoginUseCase.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';

class LoginViewModel extends GetxController {
  static LoginViewModel get to => Get.find();

  // Input variables
  RxString email = "".obs;
  RxString password = "".obs;

  // Use case
  var loginUseCase = LoginUseCase();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void login(BuildContext context) async {
    Result<dynamic, String> loginResult =
        await loginUseCase.execute(email.value, password.value);

    print("loginResult $loginResult");

    if (loginResult.status == ResultStatus.success) {
      Get.to(() => const RootScaffold(), transition: Transition.fadeIn);
    } else {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: Material(
                  color: Colors.transparent,
                  child: Text('Hello'),
                ),
              ));
    }
  }
}
