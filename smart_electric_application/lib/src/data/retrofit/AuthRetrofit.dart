import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';

part 'AuthRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/auth")
abstract class AuthRetrofit {
  factory AuthRetrofit(Dio dio, {String baseUrl}) = _AuthRetrofit;

  // firebase token으로 refresh/access 토큰 획득
  @POST('/login')
  Future<JwtTokenDTO> getTokens(@Header("Authorization") String firebaseIdToken);

  // refresh token으로 access token 획득
  @POST('/login/issue/access')
  Future<JwtTokenDTO> getAccessTokenWithRefreshToken(@Header("Authorization") String refreshToken);

  // access 토큰 유효성 확인
  @POST('/login/verification/access')
  Future<JwtTokenDTO> checkAccessTokenVerification(@Header("Authorization") String accessToken);
}
