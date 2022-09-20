import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailVerificationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/SendEmailVerificationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUseCase.dart';



class EnterUserInfoViewModel extends GetxController {
  static EnterUserInfoViewModel get to => Get.find();
  // Pagination Presentation variables
  RxInt idx = 0.obs; // 실제 페이지 인덱스
  RxInt tempIdx = 0.obs; // fadein&out위한 임시 인덱스
  RxBool isButtonEnable = false.obs;
  RxDouble viewOpacity = 1.0.obs;

  /// Text input variables
  RxString customerNumber = "".obs; // 고객 번호(한전)
  RxString householderName = "".obs; // 고객 이름(한전 세대주 이름)
  RxString name = "".obs; // 가입 고객 이름
  RxString email = "".obs; // 사용자 이메일
  RxString password = "".obs; // 사용자 비밀번호

  // Text input error variables
  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  // Usecase instance
  final signupUseCase = SignupUseCase();
  final checkCustomerValidationUseCase = CheckInfoAgreementUseCase();
  final sendEmailVerifiedUseCase = SendEmailVerificationUseCase();
  final checkEmailVerifiedUseCase = CheckEmailVerificationUseCase();

  // Constructors
  @override
  void onInit() {
    super.onInit();

    // 페이지 인덱스 변경되되면 fade out
    ever(tempIdx, (_) => viewOpacity(0.0));

    // 몇초 뒤 다시 fade in
    debounce(viewOpacity, (_) {
      viewOpacity(1.0);
    }, time: const Duration(milliseconds: 400));

    // fade out 뒤 실제 페이지 인덱스 변경
    debounce(tempIdx, (_) {
      idx(tempIdx.value);
    }, time: const Duration(milliseconds: 400));
  }

  void checkCustomerValidation() {
    checkCustomerValidationUseCase.excute();
  }

  Future<void> signup() async {
    var isSignupSuccess =
        await signupUseCase.execute(email.value, password.value);
    if (isSignupSuccess) {
      print("회원가입 성공");
      sendEmailVerification();

    } else {
      print("회원가입 실패");
    }

    return;
  }

  // 인증 이메일 보내기
  void sendEmailVerification() {
    sendEmailVerifiedUseCase.execute(email.value, password.value);
  }

  // 이메일 인증 완료 확인
  void checkEmailVerification() async {
    var isVerification =
        await checkEmailVerifiedUseCase.execute(email.value, password.value);

    if (isVerification) {
      // tempIdx++;
    } else {
      print("인증 실패");
    }
  }

  /** */

}
