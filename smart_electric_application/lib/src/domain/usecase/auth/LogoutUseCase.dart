import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/repository_interface//AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/FirebaseRepositoryInterface.dart';

class LogoutUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();
  final firebaseRepository = GetIt.I.get<FirebaseRepositoryInterface>();

  Future<Result<dynamic, String>> execute() async {
    // firebase 로그아웃
    Result<bool, String> logoutResult =
        await firebaseRepository.logout();

    if (logoutResult.status == ResultStatus.error) {
      return logoutResult;
    }

    // 내부 DB 저장 값들 지우기
    await authRepository.removeUser();
    await authRepository.removeJwt();

    // account 서버에 이메일 비활성화
    var email = await authRepository.getEmail();
    authRepository.removeEmail(email);

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
