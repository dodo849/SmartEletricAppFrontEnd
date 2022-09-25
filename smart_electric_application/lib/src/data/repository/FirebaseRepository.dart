import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

/// Firebase Authentication 기능 모음
class FirebaseRepository implements FirebaseRepositoryInterface {
  @override
  Future<Result<bool, Exception>> signup(email, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Result.failure(Exception('비밀번호 보안 강도가 약합니다'));
      } else if (e.code == 'email-already-in-use') {
        return Result.failure(Exception('이미 가입된 이메일입니다'));
      }
    } catch (_) {
      return Result.failure(Exception('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.'));
    }

    return const Result.success(true);
  }

  @override
  Future<Result<bool, Exception>> login(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        return Result.failure(Exception('가입되지 않은 이메일입니다'));
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        return Result.failure(Exception('이메일과 비밀번호가 일치하지 않습니다'));
      }
    }

    return const Result.success(true);
  }

  @override
  Future<Result<bool, Exception>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {
      return Result.failure(Exception('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.'));
    }

    return const Result.success(true);
  }

  // 이메일 인증 보내기
  @override
  Future<void> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<Result<String, Exception>> getIdToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      var idToken = await user?.getIdToken(true);
      return Result.success(idToken);
    } catch (err) {
      return Result.failure(Exception('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.'));
    }
  }

  // Future<Result<String, Exception>> getAllUser(){


  // }
}
