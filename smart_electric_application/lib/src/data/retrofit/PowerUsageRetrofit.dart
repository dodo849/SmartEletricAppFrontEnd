import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUsecase.dart';

part 'PowerUsageRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/power-usage")
abstract class PowerUsageRetrofit {
  factory PowerUsageRetrofit(Dio dio, {String baseUrl}) = _PowerUsageRetrofit;

  @GET('/specific-user/period/hour')
  Future<List<PowerUsageDTO>> getPowerUsageByHour(
      @Query('custNo') String customerNumber,
      @Query('startDate') String startDate,
      @Query('endDate') String endDate);

  @GET('/specific-user/period/day')
  Future<List<PowerUsageDTO>> getPowerUsageByDay(
      @Query('custNo') String customerNumber,
      @Query('startDate') String startDate,
      @Query('endDate') String endDate);

  @GET('/specific-user/period/month')
  Future<List<PowerUsageDTO>> getPowerUsageByMonth(
      @Query('custNo') String customerNumber,
      @Query('startDate') String startDate,
      @Query('endDate') String endDate);

  @GET('/specific-user/period/year')
  Future<List<PowerUsageDTO>> getPowerUsageByYear(
      @Query('custNo') String customerNumber,
      @Query('startDate') String startDate,
      @Query('endDate') String endDate);
}
