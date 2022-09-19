import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

class SignupUseCase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  Future<bool> execute(email, password) async {
    var isSuccess = await firebaseRepository.signup(email, password);

    if (isSuccess != null) {
      return isSuccess;
    } else {
      return false;
    }
  }
}
