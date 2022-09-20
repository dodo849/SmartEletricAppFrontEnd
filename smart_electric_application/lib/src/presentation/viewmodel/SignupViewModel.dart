import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/SendEmailVerificationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUseCase.dart';


@Deprecated('EnterUserInfo에 병합')
class SignupViewModel extends GetxController {
  RxString emailAddress = "".obs;
  RxString password = "".obs;

  Future<void> signup() async {
    var signupUseCase = SignupUseCase();
    await signupUseCase.execute(emailAddress.value, password.value);
    print("Singup ViewModel");
    emailVerified();
    return;
  }

  // 인증 이메일 보내기
  void emailVerified() {
    // var emailVerifiedUseCase = EmailVerificationUseCase();
    // emailVerifiedUseCase.execute(emailAddress.value, password.value);
  }

  // 이메일 인증 완료 확인
  void checkEmailVerified(){
    
  }
}
