import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/data/dto/UserValidationDTO.dart';

part 'BillRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/bill")
abstract class BillRetrofit {
  factory BillRetrofit(Dio dio, {String baseUrl}) = _BillRetrofit;

  // 정보제공 동의 확인
  @GET('/specific-user/bill-date')
  Future<BillDateDTO> getBillDate(@Query('custNo') String customerNumber);
}
