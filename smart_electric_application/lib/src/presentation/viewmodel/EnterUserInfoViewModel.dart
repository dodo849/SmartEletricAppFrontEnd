import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/IsSmartMeterDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailDuplicateUseCase.dart';
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

  // Text input variables
  RxString customerNumber = "".obs; // 고객 번호(한전)
  RxString householderName = "".obs; // 고객 이름(한전 세대주 이름)
  RxString name = "".obs; // 가입 고객 이름
  RxString email = "".obs; // 사용자 이메일
  RxString password = "".obs; // 사용자 비밀번호

  // Text input error variables
  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  // API result variables
  RxBool isSmartMeterLoad = false.obs; // 계량기 종류 확인 통신 상태
  RxBool isSmartMeter = false.obs; // 계량기 종류 결과 값

  // Error message variables
  RxString signupErrorMessage = "".obs;
  Rx<String?> emailErrorMessage = Rx<String?>(null);

  // Usecase instance
  final signupUseCase = SignupUseCase();
  final checkCustomerValidationUseCase = CheckInfoAgreementUseCase();
  final sendEmailVerifiedUseCase = SendEmailVerificationUseCase();
  final checkEmailVerifiedUseCase = CheckEmailVerificationUseCase();
  final checkIsSmartMeterUseCase = CheckIsSmartMeterUseCase();
  final checkEmailDuplicateUseCase = CheckEmailDuplicateUseCase();

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
    ever(idx, (_) => () {
      signupErrorMessage("");
      emailErrorMessage("");
    });

    // 이메일 변경하면 에러메세지 초기화
    ever(email, (_) => () {
      emailErrorMessage(null);
      print(emailErrorMessage);
    });
  }

  // Button Function
  void nextButtonAction() async {
    if (EnterUserInfoViewModel.to.isButtonEnable.value == true) {
      switch (EnterUserInfoViewModel.to.tempIdx.value) {
        // 고객번호&세대주 입력 시 스마트 계량기인지 확인
        case 0:
          EnterUserInfoViewModel.to.checkIsSmartMeter();
          break;
        case 3:
          EnterUserInfoViewModel.to.checkEmailDuplicate();
          return;
        // 비밀번호 입력 페이지에서 다음 버튼 클릭 시 이메일 인증 전송
        case 4:
          EnterUserInfoViewModel.to.signup(); // 아직 가입 Exception 처리 X
          EnterUserInfoViewModel.to.sendEmailVerification();
          break;
        case 5:
          EnterUserInfoViewModel.to.checkEmailVerification();
          break;
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
    print("checkIsSmartMeter 실행");

    Result<IsSmartMeterDTO, Exception> checkIsSmartMeterResult =
        await checkIsSmartMeterUseCase.excute(customerNumber.value);

    // 계량기 종류 확인 true: 스마트 계량기, false: 일반 계량기
    if (checkIsSmartMeterResult.status == ResultStatus.success) {
      IsSmartMeterDTO isSmartMeterDTO = checkIsSmartMeterResult.value!;

      // 계량기 종류 설정
      isSmartMeter(isSmartMeterDTO.custNumValidation);

      // 로딩 완료 설정
      isSmartMeterLoad(true);

      // update();
    }
    // 통신 오류
    else {
      print("오류 발생");
    }
  }

  /// 이메일 중복 확인
  void checkEmailDuplicate() async {
    Result<bool, Exception> checkEmailDuplicateResult =
        await checkEmailDuplicateUseCase.execute(email.value);

    print(checkEmailDuplicateResult.value);

    // 네트워크 에러 처리
    // assert(checkEmailDuplicateResult.status == ResultStatus.success, "네트워크 오류");

    // 중복되지 않은 이메일
    if (checkEmailDuplicateResult.value == false) {
      tempIdx++;
    }
    // 중복된 이메일
    else {
      emailErrorMessage("이미 가입된 이메일입니다.");
    }
  }

  void checkCustomerValidation() {
    checkCustomerValidationUseCase.excute();
  }

  Future<void> signup() async {
    Result<bool, Exception> isSignupResult =
        await signupUseCase.execute(email.value, password.value);
    if (isSignupResult.status == ResultStatus.success) {
      print("회원가입 성공");
      sendEmailVerification();
    } else {
      signupErrorMessage(isSignupResult.error?.toString());
    }

    return;
  }

  /// 인증 이메일 보내기
  void sendEmailVerification() {
    sendEmailVerifiedUseCase.execute(email.value, password.value);
  }

  /// 이메일 인증 완료 확인
  void checkEmailVerification() async {
    var isVerification =
        await checkEmailVerifiedUseCase.execute(email.value, password.value);

    if (isVerification) {
      // tempIdx++;
    } else {
      print("인증 실패");
    }
  }

}
