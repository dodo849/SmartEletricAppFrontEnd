import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckCustomerValidationUseCase.dart';

part 'InfoRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/info")
abstract class InfoRetrofit {
  factory InfoRetrofit(Dio dio, {String baseUrl}) = _InfoRetrofit;

  // 정보제공 동의 확인
  @POST('/specific-user/validation')
  Future<JwtTokenDTO> checkInfoValidation(@Query('custNo') customerNumber);
}