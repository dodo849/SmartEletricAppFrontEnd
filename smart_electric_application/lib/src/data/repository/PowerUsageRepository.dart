import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/PowerUsageRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByDayUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRetrofitInterface.dart';

class PowerUsageRepository implements PowerUsageRetrofitInterface {
  @override
  Future<Result<List<PowerUsageByDayDTO>, String>> getPowerUsageByDay(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {

    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageByDayDTO> powerUsageByDayDTO =
          await retrofit.getPowerUsageByDay(customerNumber, startDate, endDate);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
