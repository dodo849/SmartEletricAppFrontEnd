import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/LoginUseCase.dart';

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

  void login() {
    loginUseCase.execute(email.value, password.value);
  }
}
