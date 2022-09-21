import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailVerificationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckIsSmartMeterUseCase.dart';
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

  // API result variables
  RxBool? isSmartMeter;

  // Usecase instance
  final signupUseCase = SignupUseCase();
  final checkCustomerValidationUseCase = CheckInfoAgreementUseCase();
  final sendEmailVerifiedUseCase = SendEmailVerificationUseCase();
  final checkEmailVerifiedUseCase = CheckEmailVerificationUseCase();
  final checkIsSmartMeterUseCase = CheckIsSmartMeterUseCase();

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

  // 스마트 계량기인지 고객번호로 확인
  void checkIsSmartMeter() async{
    dynamic checkIsSmartMeterResult =
        await checkIsSmartMeterUseCase.excute(customerNumber.value);

    print("### Is Smart Meter");
    print(checkIsSmartMeterResult.error.message);

    switch (checkIsSmartMeterResult.status){
      case Result.success:
        if (checkIsSmartMeterResult.value == "true"){
          isSmartMeter!(true);
        } else if (checkIsSmartMeterResult.value == "false"){
          isSmartMeter!(false);
        }
        break;
      case Result.failure:
        throw Exception("오류가 발생했습니다. 고객번호 입력부터 다시 시도해주세요.");
    }
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
