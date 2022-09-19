import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AuthRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getDefaultDio.dart';

class AuthRepository {
  Future<Result<JwtTokenDTO, Exception>> getJwtTokens(
      String firebaseIdToken) async {
    try {
      final dio = await getDefaultDio();
      final retrofit = AuthRetrofit(dio);

      // 서버에서 firbase id token으로 access/refresh token 발급받기
      JwtTokenDTO jwtTokens = await retrofit.getTokens(firebaseIdToken);

      return Result.success(jwtTokens);
    } catch (err) {
      return Result.failure(Exception(err));
    }
  }

  Future<Result<bool, Exception>> setJwtTokenDTOInDB(JwtTokenDTO tokens) async {
    try {
      const storage = FlutterSecureStorage();

      // 기존 로그인 정보 초기화
      await storage.deleteAll();

      // access/refesh token 내부 DB에 저장하기
      await storage.write(key: 'ACCESS_TOKEN', value: tokens.accessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: tokens.refreshToken);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(Exception(err));
    }
  }
}
