import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 로그인시 firebase login -> 서버에서 access/refresh token 발급 -> 내부 DB 저장 순으로 진행
class LoginUseCase {

  final firebaseRepository = GetIt.I.get<FirebaseRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, Exception>> execute(email, password) async {

    // firebase 로그인
    Result<bool, Exception> result = await firebaseRepository.login(email, password);

    // firebase id token 가져오기
    Result<bool, Exception> user = await firebaseRepository.getUser();   


    return result;

  }
}