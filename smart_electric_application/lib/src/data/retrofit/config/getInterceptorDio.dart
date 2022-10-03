// auth_dio.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';

Future<Dio> getInterceptorDio() async {
  var dio = Dio();

  final storage = FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // 기기에 저장된 AccessToken 로드
    storage.write(
        key: "ACCESS_TOKEN",
        value:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxMjMiLCJleHAiOjE2NjQ4MjA5MzJ9.W2_Ze7GAz0VJdwjxAMxBcey9lhmAK9MI0HpXzN90jrtCVMpm5SB32dFUCKg6fXow6aTumYDyqXQufHzA32JlWh6MujSZBgPuhqgE05Q1AOF1WxhO9-mc5R3OvKntz3kxlQZkxcX01mHaQJnW5G7DjXU8YVX_BeithF4T1jjDaezbBhfbsA2a3XPiJeGCBHholcxY9vCrFGSSFEBGnHEUdjq_HJriyNpdKlXXaym_ph5eCXNb2RX7ZovVoZfu8WjMy39S3dbRWP87ahbcLVlxF4A_bkflmJAXnjXhUCVMIOpNQe4q5SQ_3sSxZl4GZXoshTfl9uLlDLl7SvOlOyPPXbRx0O5r38oUiu0G57oZQI8i8JzbP3trerrICxtETM_zgwGfnmpireLZGFk3gesEQiVoLmGdouyI-T33K3wVRdveMXXM1Y0_wX5qCNajaM6-dH0L-uPLDyCLiEQZUZxd21zOY0hPtRABNNyPtdNZBCgLyaQFOab0tm6bP8-tYIhmWoT3nLeHyLDl9yzb2BXvTLp0d3RUxU7AJQ3W3hQsfLG2PE-AUlMeN1zhqcT81Q3yuB6vnMPUdL4PhcbJqL6K-zKLOJgvX81bETVVuqc6gCizDf7h7r2BRasBid7_rg4QiFYuvPUqoLpeYwyYthmGT35HPo3edSfiJbqz4usKVU8");
    final accessToken = await storage.read(key: 'ACCESS_TOKEN');
    print("accessToken $accessToken");

    // 매 요청마다 헤더에 AccessToken을 포함
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }, onError: (error, handler) async {
    // // Access 토큰 유효성 검사
    // var accessTokenCheckDio = Dio();

    // accessTokenCheckDio.interceptors.clear();

    // // 기기에 저장된 AccessToken 로드
    // final accessToken = await storage.read(key: 'ACCESS_TOKEN');
    // accessTokenCheckDio.options.headers['Authorization'] =
    //     'Bearer $accessToken';

    // var isAccessTokenVerification = await accessTokenCheckDio
    //     .post('https://api.smartelectric.kr/auth/login/verification/access');

    // print("### Interceptor");
    // print(isAccessTokenVerification);

    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {
      // 기기에 저장된 AccessToken과 RefreshToken 로드
      final accessToken = await storage.read(key: 'ACCESS_TOKEN');
      final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
      var refreshDio = Dio();

      refreshDio.interceptors.clear();

      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {
        // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
        if (error.response?.statusCode == 401) {
          // 기기의 자동 로그인 정보 삭제
          await storage.deleteAll();

          // . . .
          // ### 수정 필요
          // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
          // . . .
        }
        return handler.next(error);
      }));

      // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
      refreshDio.options.headers['Authorization'] = 'Bearer $refreshToken';
      // ### Refresh 헤더 안씀
      // refreshDio.options.headers['Refresh'] = 'Bearer $refreshToken';

      // 토큰 갱신 API 요청
      final refreshResponse = await refreshDio
          .post('https://api.smartelectric.kr/auth/login/issue/access');

      // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
      final newAccessToken = refreshResponse.data['access-token'];
      // final newRefreshToken = refreshResponse.data['refresh-token'];

      // 기기에 저장된 AccessToken과 RefreshToken 갱신
      await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      // await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);

      // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
      error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      // 수행하지 못했던 API 요청 복사본 생성
      final clonedRequest = await dio.request(error.requestOptions.path,
          options: Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers),
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters);

      // API 복사본으로 재요청
      return handler.resolve(clonedRequest);
    }

    return handler.next(error);
  }));

  return dio;
}
