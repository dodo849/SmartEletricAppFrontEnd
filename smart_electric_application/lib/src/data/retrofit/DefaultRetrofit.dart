
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:smart_electric_application/src/data/dto/IsSmartMeterDTO.dart';


part 'DefaultRetrofit.g.dart';

/// 일회성 api 모음
@RestApi(baseUrl: "https://api.smartelectric.kr/")
abstract class DefaultRetrofit{
  factory DefaultRetrofit(Dio dio, {String baseUrl}) = _DefaultRetrofit;

  // 고객번호로 고객의 스마트 계량기 여부 확인
  @GET('kepcoCustNumValidation')
  Future<IsSmartMeterDTO> checkIsSmartMeter(
    @Query("custNum") String customerNumber);
}
