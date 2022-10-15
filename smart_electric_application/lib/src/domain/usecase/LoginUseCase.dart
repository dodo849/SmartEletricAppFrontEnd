import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 로그인시 firebase login -> 서버에서 access/refresh token 발급 -> 내부 DB 저장 순으로 진행
class LoginUsecase {
  final firebaseRepository = GetIt.I.get<FirebaseRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<dynamic, String>> execute(email, password) async {
    // firebase 로그인
    Result<bool, String> loginResult =
        await firebaseRepository.login(email, password);

    if (loginResult.status == ResultStatus.error) {
      return loginResult;
    }

    // 로그인 성공 시 firebase id token 가져오기
    Result<String, String> getIdTokenResult =
        await firebaseRepository.getIdToken();

    if (getIdTokenResult.status == ResultStatus.error) {
      return getIdTokenResult;
    }

    // id 토큰으로 서버 토큰 발급받기
    Result<JwtTokenDTO, String> getJwtTokensResult =
        await authRepository.getJwtTokens(getIdTokenResult.value!);

    if (getJwtTokensResult.status == ResultStatus.error) {
      return getJwtTokensResult;
    }

    // 서버토큰 발급 성공 시 내부 DB에 저장하기
    Result<bool, String> saveTokensResult =
        await authRepository.saveJwtTokens(getJwtTokensResult.value!);

    if (saveTokensResult.status == ResultStatus.error) {
      return saveTokensResult;
    }

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
