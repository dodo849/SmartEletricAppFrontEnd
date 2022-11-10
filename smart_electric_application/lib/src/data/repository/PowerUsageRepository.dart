import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/PowerUsageRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/usecase/GetPowerUsageByDayUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

class PowerUsageRepository implements PowerUsageRepositoryInterface {
  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByDay(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageDTO> powerUsageByDayDTO =
          await retrofit.getPowerUsageByDay(customerNumber, startDate, endDate);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByHour(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageDTO> powerUsageByDayDTO = await retrofit
          .getPowerUsageByHour(customerNumber, startDate, endDate);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByMonth(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageDTO> powerUsageByDayDTO = await retrofit
          .getPowerUsageByMonth(customerNumber, startDate, endDate);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByYear(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageDTO> powerUsageByDayDTO = await retrofit
          .getPowerUsageByYear(customerNumber, startDate, endDate);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<PowerUsageDTO, String>> getRecentPowerUsageByMonth(
      {required String customerNumber}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      PowerUsageDTO powerUsageByDayDTO =
          await retrofit.getRecentPowerUsageByMonth(customerNumber);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

    @override
  Future<Result<List<PowerUsageDTO>, String>> getRecentPowerUsageByHour(
      {required String customerNumber}) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = PowerUsageRetrofit(dio);

      List<PowerUsageDTO> powerUsageByDayDTO =
          await retrofit.getRecentPowerUsageByHour(customerNumber);

      return Result.success(powerUsageByDayDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
