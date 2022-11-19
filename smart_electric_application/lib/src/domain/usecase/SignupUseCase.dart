import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/LoginUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

///
class SignupUsecase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();
  final AccountRepositoryInterface accountRepository =
      GetIt.I.get<AccountRepositoryInterface>();

  // Usecase
  final loginUseCase = LoginUsecase();

  Future<Result<bool, String>> execute(
      {required String customerNumber,
      required String name,
      required String email,
      required String password,
      required bool isSmartMeter}) async {
    // 파이어베이스 회원가입
    Result<bool, String> signupResult =
        await firebaseRepository.signup(email, password);

    if (signupResult.status == ResultStatus.error) {
      return signupResult;
    }

    // Account 서버에 유저 생성
    var firebaseUidResult = await firebaseRepository.getUid();
    if (firebaseUidResult.status == ResultStatus.error) {
      return Result.failure(firebaseUidResult.error.toString());
    }

    // ### firebase message token으로 바꿔야함
    var firebaseIdTokenResult = await firebaseRepository.getIdToken();
    if (firebaseUidResult.status == ResultStatus.error) {
      return Result.failure(firebaseUidResult.error.toString());
    }

    Result<bool, String> requestRegisterAccountResult =
        await accountRepository.requestRegisterAccount(
            accountRegistrationDTO: AccountRegistrationDTO(
                customerNumber: customerNumber,
                email: email,
                firebaseMessageToken: firebaseIdTokenResult.value!,
                firebaseUid: firebaseUidResult.value!,
                isSmartMeter: isSmartMeter,
                name: name));

    if (requestRegisterAccountResult.status == ResultStatus.error) {
      return Result.failure(requestRegisterAccountResult.error.toString());
    }

    // 유저 정보 내부 DB에 저장
    Result<bool, String> saveUserResult = await authRepository.saveUser(
        customerNumber: customerNumber,
        name: name,
        email: email,
        isSmartMeter: isSmartMeter);

    if (saveUserResult.status == ResultStatus.error) {
      return saveUserResult;
    }

    // 회원가입 성공시 로그인
    loginUseCase.execute(email, password);

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
