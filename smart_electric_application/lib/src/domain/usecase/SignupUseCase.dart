import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

class SignupUseCase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  Future<bool> execute(email, password) async {
    Result<bool, Exception> signupResult =
        await firebaseRepository.signup(email, password);

    // switch (signupResult.status) {
    //   case ResultStatus.success:
    //     User? user = firebaseRepository.getUser();
    //     var idToken = await user?.getIdToken();

    // }

    return true;
  }
}
