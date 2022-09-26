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
    Result<bool, String> signupResult =
        await firebaseRepository.signup(email, password);

    if (signupResult.status == ResultStatus.error) {
      return signupResult;
    }

    Result<bool, String> saveUserResult = await authRepository.saveUserToDB(
        customerNumber: customerNumber, name: name, email: email);

    if (saveUserResult.status == ResultStatus.error) {
      return saveUserResult;
    }

    return const Result.success(true);
  }
}
