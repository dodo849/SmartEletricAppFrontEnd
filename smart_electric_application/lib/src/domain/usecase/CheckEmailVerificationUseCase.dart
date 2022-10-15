import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckEmailVerificationUsecase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  // 나중에 email, password 로컬 DB에서 가져오는 걸로 바꾸기
  Future<bool> execute(email, password) async {
    // 이메일 인증 후 로그아웃 -> 재로그인 과정 필요
    await firebaseRepository.logout();

    await firebaseRepository.login(email, password);

    var user = firebaseRepository.getUser();

    if (user != null && user.emailVerified) {

      var userToken = await user.getIdToken();

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };

      var url = Uri.parse(
        'https://api.smartelectric.kr/auth/login',
      );
      var response = await http.post(url, headers: headers);
      print('Response status: ${response.body}');
      var jsonsDataString = response.body.toString();
      var data = jsonDecode(jsonsDataString);
      print('Response body: ${data}');

      // 인증 완료 시 true 반환
      return true;
    } else {
      return false;
    }
  }
}
