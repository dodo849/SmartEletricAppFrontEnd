import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

class GetRecentPowerUsageByDayUsecase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<RecentPowerUsageByDayDTO, String>> execute() async {
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("고객번호 가져오기 실패");
    }

    // 네트워크
    Result<RecentPowerUsageByDayDTO, String> getRecentPowerUsageByDayResult =
        await powerUsageRepository.getRecentPowerUsageByDay(
            customerNumber: getCustomerNumberResult.value!);

    return getRecentPowerUsageByDayResult;
  }
}
