import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUseCase.dart';

part 'PowerUsageRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/power-usage")
abstract class PowerUsageRetrofit {
  factory PowerUsageRetrofit(Dio dio, {String baseUrl}) = _PowerUsageRetrofit;

  // 정보제공 동의 확인
  @GET('/specific-user/period/day')
  Future<List<PowerUsageByDayDTO>> getPowerUsageByDay(@Query('custNo') String customerNumber,
      @Query('startDate') String startDate, @Query('endDate') String endDate);
}
