import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AuthRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getDefaultDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

class AuthRepository implements AuthRepositoryInterface{
  /// firebase id token을 이용해 서버에서 access/refresh 토큰 발급받기
  @override
  Future<Result<JwtTokenDTO, Exception>> getJwtTokens(
      String firebaseIdToken) async {
    try {
      final dio = await getDefaultDio();
      final authRetrofit = AuthRetrofit(dio);

      // 서버에서 firbase id token으로 access/refresh token 발급받기
      JwtTokenDTO jwtTokens = await authRetrofit.getTokens(firebaseIdToken);

      return Result.success(jwtTokens);
    } catch (err) {
      return Result.failure(Exception(err));
    }
  }

  /// 서버에서 받은 access/refresh 토큰을 내부 DB에 저장하기
  @override
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