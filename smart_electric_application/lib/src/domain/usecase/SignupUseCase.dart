import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

class SignupUseCase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  Future<Result<bool, Exception>> execute(email, password) async {
    Result<bool, Exception> signupResult =
        await firebaseRepository.signup(email, password);

    return signupResult;
  }
}
