import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/repository_interface/FirebaseRepositoryInterface.dart';

/// Firebase Authentication 기능 모음
class FirebaseRepository implements FirebaseRepositoryInterface {
  @override
  Future<Result<bool, String>> signup(email, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Result.failure('비밀번호 보안 강도가 약합니다');
      } else if (e.code == 'email-already-in-use') {
        return Result.failure('이미 가입된 이메일입니다');
      }
    } catch (_) {
      return Result.failure('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.');
    }

    return const Result.success(true);
  }

  @override
  Future<Result<bool, String>> login(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        return Result.failure('가입되지 않은 이메일입니다');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        return Result.failure('이메일과 비밀번호가 일치하지 않습니다');
      }
    }

    return const Result.success(true);
  }

  @override
  Future<Result<bool, String>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {
      return Result.failure('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.');
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
  Future<Result<String, String>> getIdToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      var idToken = await user?.getIdToken(true);
      return Result.success(idToken);
    } catch (err) {
      return Result.failure('Fail to load id token. Try again.');
    }
  }

  @override
  Future<Result<String, String>> getUid() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      var uid = await user?.uid;
      return Result.success(uid);
    } catch (err) {
      return Result.failure('Fail to load uid. Try again.');
    }
  }

  @override
  Future<String> getMessageToken() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? messageToken = await FirebaseMessaging.instance.getToken();
      if (messageToken == null) {
        return "fail";
      } else {
        return messageToken;
      }
    } catch (err) {
      rethrow;
    }
  }
}
