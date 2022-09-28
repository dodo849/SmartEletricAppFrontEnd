import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/data/repository/PowerUsageRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';

class GetPowerUsageByDayUseCase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRepository>();

  Future<Result<List<PowerUsageByDayDTO>, String>> excute(
      customerNumber, startDate, endDate) async {
    // 네트워크
    Result<List<PowerUsageByDayDTO>, String> isPowerUsageResult =
        await powerUsageRepository.getPowerUsageByDay(
            customerNumber: customerNumber,
            startDate: startDate,
            endDate: endDate);

    // 예외 처리
    if (isPowerUsageResult.status == ResultStatus.error) {
      return Result.failure(isPowerUsageResult.error);
    }

    print(isPowerUsageResult);

    // 바 그래프 형식으로 바꾸기
    // PowerUsageByDayDTO powerUsageByDayDTO = isPowerUsageResult.value!;

    return isPowerUsageResult;
  }
}
