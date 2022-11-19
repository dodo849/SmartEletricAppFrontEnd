import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 로그인시 firebase login -> 서버에서 access/refresh token 발급 -> 내부 DB 저장 순으로 진행
class LoginUsecase {
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();
  final AccountRepositoryInterface accountRepository =
      GetIt.I.get<AccountRepositoryInterface>();

  Future<Result<bool, String>> execute(email, password) async {
    // firebase 로그인
    Result<bool, String> loginResult =
        await firebaseRepository.login(email, password);

    if (loginResult.status == ResultStatus.error) {
      return Result.failure(loginResult.error);
    }

    // 로그인 성공 시 firebase id token 가져오기
    Result<String, String> getIdTokenResult =
        await firebaseRepository.getIdToken();

    if (getIdTokenResult.status == ResultStatus.error) {
      return Result.failure(getIdTokenResult.error);
    }

    // id 토큰으로 서버 토큰 발급받기
    Result<JwtTokenDTO, String> requestJwtResult =
        await authRepository.requestJwt(getIdTokenResult.value!);

    if (requestJwtResult.status == ResultStatus.error) {
      return Result.failure(requestJwtResult.error);
    }

    // 서버토큰 발급 성공 시 내부 DB에 저장하기
    Result<bool, String> saveTokensResult =
        await authRepository.saveJwt(requestJwtResult.value!);

    if (saveTokensResult.status == ResultStatus.error) {
      return Result.failure(saveTokensResult.error);
    }

    // user 정보 받아오기
    Result<AccountRegistrationDTO, String> requestAccountResult =
        await accountRepository.requestAccount(email: email);

    if (requestAccountResult.status == ResultStatus.error) {
      return Result.failure(requestAccountResult.error);
    }

    // user 정보 내부 storage에 저장
    Result<bool, String> saveUserResult = await authRepository.saveUser(
        customerNumber: requestAccountResult.value!.customerNumber,
        email: requestAccountResult.value!.email,
        name: requestAccountResult.value!.name,
        isSmartMeter: requestAccountResult.value!.isSmartMeter);

    if (requestAccountResult.status == ResultStatus.error) {
      return Result.failure(requestAccountResult.error);
    }

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
