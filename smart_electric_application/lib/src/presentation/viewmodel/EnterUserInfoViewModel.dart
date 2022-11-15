import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/SmartMeterDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailDuplicateUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailVerificationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckIsSmartMeterUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/SendEmailVerificationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';

class EnterUserInfoViewModel extends GetxController {
  static EnterUserInfoViewModel get to => Get.find();
  // Pagination Presentation variables
  RxInt idx = 0.obs; // 실제 페이지 인덱스
  RxInt tempIdx = 0.obs; // fadein&out위한 임시 인덱스
  RxBool isButtonEnable = false.obs;
  RxDouble viewOpacity = 1.0.obs;

  // Text input variables
  RxString customerNumber = "".obs; // 고객 번호(한전)
  RxString householderName = "".obs; // 고객 이름(한전 세대주 이름)
  RxString name = "".obs; // 가입 고객 이름
  RxString email = "".obs; // 사용자 이메일
  RxString password = "".obs; // 사용자 비밀번호

  // Text input error variables
  // RxString emailError = "".obs;
  // RxString passwordError = "".obs;

  // API result variables
  RxBool isSmartMeterLoad = false.obs; // 계량기 종류 확인 통신 상태
  RxBool isSmartMeter = false.obs; // 계량기 종류 결과 값

  // Error message variables
  RxBool isSingupError = false.obs;
  RxString signupErrorMessage = "".obs;
  RxBool isEmailError = false.obs;
  RxString emailErrorMessage = "".obs;
  RxBool isPasswordError = false.obs;
  RxString passwordErrorMessage = "".obs;
  RxBool isEmailVerificationError = false.obs;
  RxString emailVerificationErrorMessage = "".obs;

  // Usecase instance
  final signupUseCase = SignupUsecase();
  final checkCustomerValidationUseCase = CheckInfoAgreementUsecase();
  final sendEmailVerifiedUseCase = SendEmailVerificationUsecase();
  final checkEmailVerifiedUseCase = CheckEmailVerificationUsecase();
  final checkIsSmartMeterUseCase = CheckIsSmartMeterUsecase();
  final checkEmailDuplicateUseCase = CheckEmailDuplicateUsecase();

  // Constructor
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

    // 페이지 인덱스 변경될 때마다 에러 메세지 초기화
    ever(idx, (_) {
      isSingupError(false);
      signupErrorMessage("");
      isEmailError(false);
      emailErrorMessage("");
      isEmailVerificationError(false);
      emailVerificationErrorMessage("");
    });

    // 이메일 변경하면 에러메세지 초기화
    ever(email, (_) {
      isEmailError(false);
    });

    // 이메일 변경하면 에러메세지 초기화
    ever(password, (_) {
      isPasswordError(false);
    });
  }

  // Button Action Function

  void nextButtonAction() async {
    if (EnterUserInfoViewModel.to.isButtonEnable.value == true) {
      switch (EnterUserInfoViewModel.to.tempIdx.value) {
        // 고객번호&세대주 입력 시 스마트 계량기인지 확인
        case 0:
          EnterUserInfoViewModel.to.checkIsSmartMeter();
          break;
        case 3:
          EnterUserInfoViewModel.to.checkEmailDuplicate();
          // checkEmailDuplicate 함수에서 성공 여부 확인하고 idx++
          return;
        // 비밀번호 입력 페이지에서 다음 버튼 클릭 시 이메일 인증 전송
        case 4:
          EnterUserInfoViewModel.to.signup();
          // singup 함수에서 성공 여부 확인하고 idx++
          return;
        case 5:
          EnterUserInfoViewModel.to.checkEmailVerification();
          return;
        default:
          // 버튼 disabled
          EnterUserInfoViewModel.to.isButtonEnable(false);
      }

      // 페이지 이동
      EnterUserInfoViewModel.to.tempIdx++;
    }
  }

  void backButtonAction() {
    // 2번째 문항부터는 백버튼 클릭 시 이전 문항으로 돌아감
    switch (EnterUserInfoViewModel.to.idx.value) {
      case 0:
        // 첫번째 문항에선 처음화면으로 back
        Get.back();
        break;
      case 2:
        EnterUserInfoViewModel.to.tempIdx(0);
        break;
      default:
        assert(EnterUserInfoViewModel.to.idx.value > 0, "page index error");
        EnterUserInfoViewModel.to.tempIdx--;
    }
  }

  // Business Logic Function

  /// 스마트 계량기인지 고객번호로 확인
  void checkIsSmartMeter() async {

    Result<SmartMeterDTO, String> checkIsSmartMeterResult =
        await checkIsSmartMeterUseCase.execute(customerNumber.value);

    // 계량기 종류 확인 true: 스마트 계량기, false: 일반 계량기
    if (checkIsSmartMeterResult.status == ResultStatus.success) {
      SmartMeterDTO smartMeterDTO = checkIsSmartMeterResult.value!;

      // 계량기 종류 설정
      isSmartMeter(smartMeterDTO.custNumValidation);

      // 로딩 완료 설정
      isSmartMeterLoad(true);
    }
    // 통신 오류
    else {
      print("오류 발생");
    }
  }

  /// 이메일 중복 확인
  void checkEmailDuplicate() async {
    Result<bool, String> checkEmailDuplicateResult =
        await checkEmailDuplicateUseCase.execute(email.value);

    // 네트워크 에러
    if (checkEmailDuplicateResult.status == ResultStatus.error) {
      emailErrorMessage("네트워크 에러가 발생했습니다. 다시 시도해주세요.");
      return;
    }

    // 중복되지 않은 이메일
    if (checkEmailDuplicateResult.value == false) {
      // 중복 아닐때만 다음페이지로
      tempIdx++;
    }
    // 중복된 이메일
    else {
      emailErrorMessage("이미 가입된 이메일입니다.");
      isEmailError(true);
    }
  }

  /// 파이어베이스 및 서버 signup
  void signup() async {
    Result<bool, String> isSignupResult = await signupUseCase.execute(
        customerNumber: customerNumber.value,
        name: name.value,
        email: email.value,
        password: password.value,
        isSmartMeter: isSmartMeter.value);

    // 에러 발생 시 메세지 view에 띄우기
    if (isSignupResult.status == ResultStatus.error) {
      isSingupError(true);
      signupErrorMessage(isSignupResult.error);

      assert(false, isSignupResult.error);
      return;
    }

    // 성공시에만 다음 페이지로
    tempIdx++;
    
    // 회원가입 성공시 이메일로 인증링크 보내기
    sendEmailVerified();
  }

  /// 이메일 인증 보내기
  void sendEmailVerified() async {
    await sendEmailVerifiedUseCase.execute(email.value, password.value);
  }

  /// 이메일 인증 완료 확인
  void checkEmailVerification() async {
    var isVerification =
        await checkEmailVerifiedUseCase.execute(email.value, password.value);

    if (!isVerification) {
      isEmailVerificationError(true);
      emailVerificationErrorMessage("이메일 인증에 실패했습니다. 다시 시도해주세요.");
      return;
    }

    // 회원가입 로직 완료 메인화면으로.
    Get.offAll(RootScaffold());
  }
}
