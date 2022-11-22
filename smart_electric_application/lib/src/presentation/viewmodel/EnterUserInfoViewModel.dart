import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountEmailValidationDTO.dart';
import 'package:smart_electric_application/src/data/dto/SmartMeterDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckInfoAgreementUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailDuplicateUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckEmailVerificationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckIsSmartMeterUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/LogoutUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/SendEmailVerificationUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupInFirebaseUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupInServerUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomActionButton.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/EnterUserInfoPage.dart';

class EnterUserInfoViewModel extends GetxController {
  static EnterUserInfoViewModel get to => Get.find();

  // Pagination Presentation variables
  RxInt idx = 0.obs; // 실제 페이지 인덱스
  RxInt tempIdx = 0.obs; // fadein&out위한 임시 인덱스
  RxBool isButtonEnable = false.obs;
  RxDouble viewOpacity = 1.0.obs;
  RxBool isWebView = false.obs;
  RxBool isTermAgree = false.obs;
  RxString buttonText = "다음으로".obs;

  // Text input variables
  RxString customerNumber = "".obs; // 고객 번호(한전)
  RxString householderName = "".obs; // 고객 이름(한전 세대주 이름)
  RxString name = "".obs; // 가입 고객 이름
  RxString email = "".obs; // 사용자 이메일
  RxString password = "".obs; // 사용자 비밀번호
  RxString checkPassword = "".obs; // 비밀번호 확인

  // API result variables
  RxBool isSmartMeterLoad = false.obs; // 계량기 종류 확인 통신 상태
  RxBool isSmartMeter = false.obs; // 계량기 종류 결과 값

  // Error message variables
  RxBool inputError = false.obs;
  RxString errorMessage = "".obs;

  // Usecase instance
  final signupInFirebaseUseCase = SignupInFirebaseUsecase();
  final signupInServerUseCase = SignupInServerUsecase();
  final sendEmailVerifiedUseCase = SendEmailVerificationUsecase();
  final checkEmailVerifiedUseCase = CheckEmailVerificationUsecase();
  final checkIsSmartMeterUseCase = CheckIsSmartMeterUsecase();
  final checkEmailDuplicateUseCase = CheckEmailDuplicateUsecase();
  final checkInfoAgreementUsecase = CheckInfoAgreementUsecase();
  final logoutUsecase = LogoutUsecase();

  // Constructor
  @override
  void onInit() {
    super.onInit();

    // 페이지 인덱스 변경되되면 fade out
    ever(tempIdx, (_) {
      viewOpacity(0.0);
      // 웹뷰 인지 확인
      EnterUserInfoPage.values[tempIdx.value] ==
              EnterUserInfoPage.kepcoSingupMenual
          ? isWebView(true)
          : isWebView(false);
    });

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
      inputError(false);
      errorMessage("");
    });

    // 이메일 변경하면 에러메세지 초기화
    ever(email, (_) {
      inputError(false);
    });

    // 패스워드 변경하면 에러메세지 초기화
    ever(password, (_) {
      inputError(false);
    });

    // 개인정보이용약관 동의확인
    ever(isTermAgree, (_) {
      checkAgree();
    });

    // - Initalize
    // 웹뷰 인지 확인
    EnterUserInfoPage.values[tempIdx.value] ==
            EnterUserInfoPage.kepcoSingupMenual
        ? isWebView(true)
        : isWebView(false);
  }

  // - Button Action Function

  void nextButtonAction(BuildContext context) async {
    if (isButtonEnable.value == true) {
      switch (EnterUserInfoPage.values[tempIdx.value]) {
        // 고객번호&세대주 입력 시 스마트 계량기인지 확인
        case EnterUserInfoPage.enterCustomerNumber:
          checkIsSmartMeter();
          break;
        case EnterUserInfoPage.enterUserEmail:
          isButtonEnable(true);
          checkEmailDuplicate();
          // checkEmailDuplicate 함수에서 성공 여부 확인하고 idx++
          return;
        case EnterUserInfoPage.enterUserPassword:
          passwordValidation();
          isButtonEnable(true);
          return;
        // singup 함수에서 성공 여부 확인하고 idx++
        case EnterUserInfoPage.checkPassword:
          if (checkingPassword()) {
            await signupInFirebase();
          }
          return;
        // 비밀번호 입력 페이지에서 다음 버튼 클릭 시 이메일 인증 전송
        case EnterUserInfoPage.emailVerification:
          checkEmailVerification(context);
          return;
        case EnterUserInfoPage.explanationOfInfoAgreement:
          isButtonEnable(true);
          break;
        case EnterUserInfoPage.kepcoSingupMenual:
          // 정보제공 동의 했는지 확인
          checkInfoAgreement(context);
          // 다음이 마지막 문항이므로 완료하기로 변경
          buttonText("완료하기");
          // 동의합니다 초기화
          isTermAgree(false);
          // 동의전 -> 버튼 disabled
          isButtonEnable(false);
          return;
        case EnterUserInfoPage.signupPrivacyTermsConditions:
          // 회원가입 로직 모두 완료 시 메인으로
          Get.to(const RootScaffold(), transition: Transition.upToDown);
          return;
        default:
          // 버튼 disabled
          isButtonEnable(false);
      }

      // 페이지 이동
      tempIdx++;
    }
  }

  void backButtonAction() async {
    // 2번째 문항부터는 백버튼 클릭 시 이전 문항으로 돌아감
    switch (EnterUserInfoPage.values[tempIdx.value]) {
      case EnterUserInfoPage.enterCustomerNumber:
        // 첫번째 문항에선 처음화면으로 back
        await logoutUsecase.execute();
        Get.back();
        break;
      // 이름 입력 전 페이지가 스마트미터 페이지라 패스하고 맨 처음으로
      case EnterUserInfoPage.enterUserName:
        tempIdx(0);
        break;
      default:
        isButtonEnable(true);
        buttonText("다음으로");
        if (tempIdx > 0) {
          tempIdx--;
        }
    }
  }

  // - Business Logic Function

  /// 스마트 계량기인지 고객번호로 확인
  void checkIsSmartMeter() async {
    Result<SmartMeterDTO, String> checkIsSmartMeterResult =
        await checkIsSmartMeterUseCase.execute(customerNumber.value);

    // 계량기 종류 확인 true: 스마트 계량기, false: 일반 계량기
    if (checkIsSmartMeterResult.status == ResultStatus.success) {
      SmartMeterDTO smartMeterDTO = checkIsSmartMeterResult.value!;

      // 계량기 종류 설정
      isSmartMeter(smartMeterDTO.custNumValidation);

      // 일반 계량기 사용자는 가입못하도록
      if (smartMeterDTO.custNumValidation == false) {
        isButtonEnable(false);
      }

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
    Result<AccountEmailValidationDTO, String> checkEmailDuplicateResult =
        await checkEmailDuplicateUseCase.execute(email.value);

    // 네트워크 에러
    if (checkEmailDuplicateResult.status == ResultStatus.error) {
      errorMessage("네트워크 에러가 발생했습니다. 다시 시도해주세요.");
      return;
    }

    // 중복되지 않은 이메일
    if (checkEmailDuplicateResult.value!.result == false) {
      // 중복 아닐때만 다음페이지로
      tempIdx++;
    }
    // 중복된 이메일
    else {
      errorMessage("이미 가입된 이메일입니다.");
      inputError(true);
    }
  }

  /// 파이어베이스 회원가입
  Future<void> signupInFirebase() async {
    Result<bool, String> isSignupResult = await signupInFirebaseUseCase.execute(
        customerNumber: customerNumber.value,
        name: name.value,
        email: email.value,
        password: password.value,
        isSmartMeter: isSmartMeter.value);

    // ### 에러 발생 시 메세지 view에 띄우기
    if (isSignupResult.status == ResultStatus.error) {
      print("isSignupResult ${isSignupResult.error}");
      return;
    } else {
      // 성공시에만 다음 페이지로
      tempIdx++;

      // 회원가입 성공시 이메일로 인증링크 보내기
      sendEmailVerified();
      return;
    }
  }

  /// 서버 회원가입 (이메일 인증 성공시에 실행)
  Future<void> signupInServer() async {
    Result<bool, String> isSignupResult = await signupInServerUseCase.execute(
        customerNumber: customerNumber.value,
        name: name.value,
        email: email.value,
        password: password.value,
        isSmartMeter: isSmartMeter.value);

    // ### 에러 발생 시 메세지 view에 띄우기
    if (isSignupResult.status == ResultStatus.error) {
      print("isSignupResult ${isSignupResult.error}");
      return;
    } else {
      return;
    }
  }

  /// 이메일 인증 보내기
  void sendEmailVerified() async {
    await sendEmailVerifiedUseCase.execute(email.value, password.value);
  }

  /// 이메일 인증 완료 확인
  void checkEmailVerification(BuildContext context) async {
    var isVerification =
        await checkEmailVerifiedUseCase.execute(email.value, password.value);

    // 인증 실패
    if (!isVerification) {
      showDialog(
          context: context,
          builder: (context) => CustomDialog(
                title: "이메일 인증 실패",
                content: "이메일 인증이 완료되지 않았습니다.\n다시 시도해주세요.",
                actionButtons: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomActionButton(
                        text: "다시 보내기",
                        onTap: () {
                          sendEmailVerified();
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 5),
                      CustomActionButton(
                        text: "확인",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                ],
              ));
      return;
      // 인증 성공
    } else {
      tempIdx++;
      signupInServer();
    }
  }

  /// 비밀번호 8자리 이상 특수문자 포함했는지 확인
  void passwordValidation() {
    if (password.value.length < 8) {
      inputError(true);
      errorMessage("8자리 이상 입력해주세요");
    } else if (!password.value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      inputError(true);
      errorMessage("비밀번호는 특수문자를 한개 이상 포함해야합니다");
    } else {
      tempIdx++;
    }
  }

  /// 비밀번호 재확인
  bool checkingPassword() {
    if (password.value != checkPassword.value) {
      inputError(true);
      errorMessage("비밀번호가 일치하지 않습니다");
      return false;
    } else {
      return true;
    }
  }

  void checkInfoAgreement(BuildContext context) async {
    print("정보제공동의 확인");
    try {
      bool isAgree = await checkInfoAgreementUsecase.execute();
      if (!isAgree) {
        showDialog(
            context: context,
            builder: (context) => CustomDialog(
                  title: "",
                  content: "정보제공동의가 완료되지 않았습니다.\n다시 시도해주세요.",
                  actionButtons: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomActionButton(
                          text: "확인",
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  ],
                ));
      } else {
        tempIdx++;
      }
    } catch (error, stacktrace) {
      print("한전 정보제공동의 확인 ${error}, ${stacktrace}");
    }
  }

  // 개인정보이용약관 동의했는지 확인
  void checkAgree() {
    if (isTermAgree.isTrue) {
      isButtonEnable(true);
    } else {
      isButtonEnable(false);
    }
  }
}
