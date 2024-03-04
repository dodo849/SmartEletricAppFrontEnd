import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface//PowerUsageRepositoryInterface.dart';

class GetRecentPowerUsageByHourUsecase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<List<GraphPointModel>, String>> execute() async {
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("고객번호 가져오기 실패");
    }

    // 네트워크
    Result<List<PowerUsageDTO>, String> getRecentPowerUsageByHourResult =
        await powerUsageRepository.getRecentPowerUsageByHour(
            customerNumber: getCustomerNumberResult.value!);

    // 예외 처리
    if (getRecentPowerUsageByHourResult.status == ResultStatus.error) {
      return Result.failure(getRecentPowerUsageByHourResult.error);
    }

    // Presentation Model로 바꾸기
    List<PowerUsageDTO> powerUsageByDayDTOList = getRecentPowerUsageByHourResult.value!;
    List<GraphPointModel> graphPointModelList = <GraphPointModel>[];

    for (var i = 0; i < powerUsageByDayDTOList.length; i++) {
      graphPointModelList.add(GraphPointModel(
          powerUsageByDayDTOList[i].dateTimeKr,
          powerUsageByDayDTOList[i].powerUsageQuantity));
    }

    return Result.success(graphPointModelList);
  }
}
