import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// Firebase Authentication 기능 모음
class FirebaseRepository implements FirebaseRepositoryInterface{
  @override
  Future<bool?> signup(email, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

        throw Exception('비밀번호 보안 강도가 약합니다');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        throw Exception('이미 가입된 이메일입니다');
      }
    } catch (e) {
      print(e);
      throw Exception('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }

  @override
  Future<bool?> login(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception('가입되지 않은 이메일입니다');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw Exception('이메일과 비밀번호가 일치하지 않습니다');
      }
    }
  }

  @override
  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut();
    return true;
  }

  // 이메일 인증 보내기
  @override
  Future<void> sendEmailVerification() async {
    User? user = getUser();

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
