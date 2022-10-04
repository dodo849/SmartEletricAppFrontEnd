import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageByDayDTO.dart';

/// Firebase Authentication Repository Interface
abstract class PowerUsageRetrofitInterface {
  Future<Result<List<PowerUsageByDayDTO>, String>> getPowerUsageByDay(
      {required String customerNumber,
      required String startDate,
      required String endDate});
}
