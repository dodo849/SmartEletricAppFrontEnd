import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/IsSmartMeterDTO.dart';

/// Basic url api
abstract class DefaultRepositoryInterface {
  Future<Result<IsSmartMeterDTO, Exception>> checkIsSmartMeter(
      String customerNumber);
}
