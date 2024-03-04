import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/LoginUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/LogoutUsecase.dart';
import 'package:smart_electric_application/src/domain/repository_interface/FirebaseRepositoryInterface.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckEmailVerificationUsecase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  // Uscase
  final logoutUsecase = LogoutUsecase();
  final loginUsecase = LoginUsecase();

  Future<bool> execute(email, password) async {
    // 이메일 인증 후 로그아웃 -> 재로그인 과정 필요
    await firebaseRepository.logout();
    await firebaseRepository.login(email, password);

    // Uscase 호출로 변경
    // await logoutUsecase.execute();
    // Result<bool, String> loginResult = await loginUsecase.execute(email, password);

    // print("loginResult ${loginResult.error}");

    var user = firebaseRepository.getUser();

    if (user != null && user.emailVerified) {
      // 인증 완료 시 true 반환
      return true;
    } else {
      return false;
    }
  }
}
