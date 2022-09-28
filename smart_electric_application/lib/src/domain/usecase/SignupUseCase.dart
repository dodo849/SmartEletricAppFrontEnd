import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// 
class SignupUseCase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> execute(
      {required String customerNumber,
      required String name,
      required String email,
      required String password}) async {

    // 파이어베이스 회원가입    
    Result<bool, String> signupResult =
        await firebaseRepository.signup(email, password);

    if (signupResult.status == ResultStatus.error) {
      return signupResult;
    }

    // 이메일 서버에 저장
    Result<bool, String> saveEmailToServerResult = await authRepository.saveEmailToServer(email);

    if (saveEmailToServerResult.status == ResultStatus.error) {
      return saveEmailToServerResult;
    }

    // 유저 정보 내부 DB에 저장
    Result<bool, String> saveUserResult = await authRepository.saveUserToDB(
        customerNumber: customerNumber, name: name, email: email);

    if (saveUserResult.status == ResultStatus.error) {
      return saveUserResult;
    }

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
