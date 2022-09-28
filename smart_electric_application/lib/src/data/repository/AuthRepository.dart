import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AuthRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getDefaultDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

class AuthRepository implements AuthRepositoryInterface {
  /// firebase id token을 이용해 서버에서 access/refresh 토큰 발급받기
  @override
  Future<Result<JwtTokenDTO, String>> getJwtTokens(
      String firebaseIdToken) async {
    try {
      final dio = await getDefaultDio();
      final authRetrofit = AuthRetrofit(dio);

      // 서버에서 firbase id token으로 access/refresh token 발급받기
      JwtTokenDTO jwtTokens =
          await authRetrofit.getJwtTokens('Bearer ${firebaseIdToken}');

      return Result.success(jwtTokens);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  /// 서버에서 받은 access/refresh 토큰을 내부 DB에 저장하기
  @override
  Future<Result<bool, String>> saveJwtTokenToDB(JwtTokenDTO tokens) async {
    try {
      const storage = FlutterSecureStorage();

      // 기존 로그인 정보 초기화
      await storage.deleteAll();

      // access/refesh token 내부 DB에 저장하기
      await storage.write(key: 'ACCESS_TOKEN', value: tokens.accessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: tokens.refreshToken);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> checkEmailDuplicate(String email) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      var emailDuplicateResult = await authRetrofit.checkEmailDuplicate(email);

      if (emailDuplicateResult.isEmailDuplicated == true) {
        return const Result.success(true);
      } else {
        return const Result.success(false);
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveEmailToServer(String email) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      var saveEmailResult = await authRetrofit.saveEmail(email);

      if (saveEmailResult.updated == true) {
        return const Result.success(true);
      } else {
        return const Result.success(false);
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveUserToDB({
      required String customerNumber, required String name, required String email}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('customerNumber', customerNumber);
      await prefs.setString('name', name);
      await prefs.setString('email', email);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  Future<Result<String, String>> getCustomerNumber() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      var customerNumber = prefs.getString('customerNumber');

      return Result.success(customerNumber);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
