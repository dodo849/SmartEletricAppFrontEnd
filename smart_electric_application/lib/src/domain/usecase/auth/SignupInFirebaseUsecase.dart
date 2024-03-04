import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/LoginUseCase.dart';
import 'package:smart_electric_application/src/domain/repository_interface//AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface//AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/FirebaseRepositoryInterface.dart';

///
class SignupInFirebaseUsecase {
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

    // 파이어베이스 uid 가져오기
    var getIdTokenResult = await firebaseRepository.getIdToken();
    if (getIdTokenResult.status == ResultStatus.error) {
      return Result.failure(getIdTokenResult.error.toString());
    }

    // auth 서버에서 JWT 발급받기
    Result<JwtTokenDTO, String> getJwtResult =
        await authRepository.requestJwt(getIdTokenResult.value!);

    if (getJwtResult.status == ResultStatus.error) {
      return Result.failure(getJwtResult.error.toString());
    }

    // 내부 저장소에 JWT 저장해서 인증 권한 받기
    Result<bool, String> saveJwtResult =
        await authRepository.saveJwt(getJwtResult.value!);

    if (saveJwtResult.status == ResultStatus.error) {
      return Result.failure(saveJwtResult.error.toString());
    }
    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
