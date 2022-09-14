import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_electric_application/src/data/repository/firebase/FirebaseRepository.dart';

class SignupUseCase {

  Future<bool?> execute(email, password) async {
    FirebaseRepository firebaseRepository = FirebaseRepository();

    var isSuccess = await firebaseRepository.signup(email, password);

    return isSuccess;

  }
}
