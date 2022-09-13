import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/EmailVerifiedUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUseCase.dart';

class SignupViewModel extends GetxController {
  RxString emailAddress = "".obs;
  RxString password = "".obs;

  void signup() async {
    var signupUseCase = SignupUseCase();
    var result = await signupUseCase.execute(emailAddress.value, password.value);

    // if(result == true){
    //   emailVerified();
    // }
  }

  void emailVerified() {
    var emailVerifiedUseCase = EmailVerifiedUseCase();
    emailVerifiedUseCase.execute();
  }
}
