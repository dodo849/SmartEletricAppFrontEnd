import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/SmartMeterDTO.dart';
import 'package:smart_electric_application/src/domain/repository_interface/DefaultRepositoryInterface.dart';

class CheckIsSmartMeterUsecase {
  final defaultRepository = GetIt.I.get<DefaultRepositoryInterface>();

  Future<Result<SmartMeterDTO, String>> execute(customerNumber) async {
    var isSmartMeterResult =
        await defaultRepository.checkIsSmartMeter(customerNumber);

    return isSmartMeterResult;
  }
}
