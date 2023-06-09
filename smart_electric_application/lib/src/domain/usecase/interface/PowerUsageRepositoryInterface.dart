import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';

/// Firebase Authentication Repository Interface
abstract class PowerUsageRepositoryInterface {
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByDay(
      {required String customerNumber,
      required String startDate,
      required String endDate});
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByHour(
      {required String customerNumber,
      required String startDate,
      required String endDate});
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByMonth(
      {required String customerNumber,
      required String startDate,
      required String endDate});
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByYear(
      {required String customerNumber,
      required String startDate,
      required String endDate});
  Future<Result<PowerUsageDTO, String>> getRecentPowerUsageByMonth(
      {required String customerNumber});
  Future<Result<List<PowerUsageDTO>, String>> getRecentPowerUsageByHour(
      {required String customerNumber});
  Future<Result<RecentPowerUsageByDayDTO, String>>
      getRecentPowerUsageByDay({required String customerNumber});
}
