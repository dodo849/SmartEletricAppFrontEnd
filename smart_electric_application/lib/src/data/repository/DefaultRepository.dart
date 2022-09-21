import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/IsSmartMeterDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/DefaultRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getDefaultDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';

class DefaultRepository implements DefaultRepositoryInterface{

  // 스마트 계량기인지 고객번호로 확인
  @override
  Future<Result<IsSmartMeterDTO, Exception>> checkIsSmartMeter(
      String customerNumber) async {
    try {
      final dio = Dio();
      final defaultRetrofit = DefaultRetrofit(dio);

      IsSmartMeterDTO isSmartMeter =
          await defaultRetrofit.checkIsSmartMeter(customerNumber);

      return Result.success(isSmartMeter);
    } catch (err) {
      return Result.failure(Exception(err));
    }
  }
}
