import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/SmartMeterDTO.dart';

/// Basic url api
abstract class DefaultRepositoryInterface {
  Future<Result<SmartMeterDTO, String>> checkIsSmartMeter(
      String customerNumber);
}
