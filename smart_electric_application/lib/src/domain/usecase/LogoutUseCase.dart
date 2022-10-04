import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 로그인시 firebase login -> 서버에서 access/refresh token 발급 -> 내부 DB 저장 순으로 진행
class LoginUseCase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();
  final firbaseRepository = GetIt.I.get<FirebaseRepositoryInterface>();

  Future<Result<dynamic, String>> execute(email, password) async {
    // firebase 로그아웃
    Result<bool, String> loginResult =
        await firebaseRepository.login(email, password);

    if (loginResult.status == ResultStatus.error) {
      return loginResult;
    }

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
