import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 로그인시 firebase login -> 서버에서 access/refresh token 발급 -> 내부 DB 저장 순으로 진행
class LoginUseCase {
  final firebaseRepository = GetIt.I.get<FirebaseRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, Exception>> execute(email, password) async {
    // firebase 로그인
    Result<bool, Exception> loginResult =
        await firebaseRepository.login(email, password);

    // firebase id token 가져오기
    switch (loginResult.status) {
      // 로그인 성공
      case ResultStatus.success:
        User? user = firebaseRepository.getUser();
        String? firebaseIdToken = await user?.getIdToken();

        // firbase id token 받아오는데 성공 시
        if(firebaseIdToken != null){
          Result<JwtTokenDTO, Exception> tokens = await authRepository.getJwtTokens(firebaseIdToken);
        } else {
          return Result.failure(Exception("firebase token을 받아오는데 실패했습니다."));
        }

        // 

        break;

        case ResultStatus.error:
        // return Result()
        break;
    }

  return Result.success(true);

  }
}
