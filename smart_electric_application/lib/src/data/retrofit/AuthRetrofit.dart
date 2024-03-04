import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/EmailDuplicateDTO.dart';
import 'package:smart_electric_application/src/data/dto/SaveEmailDTO.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';

part 'AuthRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/auth")
abstract class AuthRetrofit {
  factory AuthRetrofit(Dio dio, {String baseUrl}) = _AuthRetrofit;

  // firebase id token으로 refresh/access 토큰 획득
  @POST('/login')
  Future<JwtTokenDTO> requestJwt(
      @Header("Authorization") String firebaseIdToken);

  // refresh token으로 access token 획득
  @POST('/login/issue/access')
  Future<JwtTokenDTO> getAccessTokenWithRefreshToken(
      @Header("Authorization") String refreshToken);

  // access 토큰 유효성 확인
  @POST('/login/verification/access')
  Future<JwtTokenDTO> checkAccessTokenVerification(
      @Header("Authorization") String accessToken);

  // 이메일 중복 확인
  @GET('/signup/email-duplicate/verification')
  Future<EmailDuplicateDTO> checkEmailDuplicate(@Query("email") String email);

  // 이메일 서버에 추가
  @POST('/signup/email-duplicate/update')
  Future<SaveEmailDTO> saveEmail(@Query("email") String email);

  // 이메일 비활성화
  @POST('/signup/email-duplicate/delete')
  Future<SaveEmailDTO> removeEmail(@Query("email") String email);
}
