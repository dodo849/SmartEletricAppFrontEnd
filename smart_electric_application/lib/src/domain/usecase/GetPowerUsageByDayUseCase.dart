import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/data/repository/PowerUsageRepository.dart';
import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRetrofitInterface.dart';

class GetPowerUsageByDayUseCase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRetrofitInterface>();

  Future<Result<List<GraphPointModel>, String>> excute(
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

    print("isPowerUsageResult.status ${isPowerUsageResult.status}");

    // Presentation Model로 바꾸기
    List<PowerUsageByDayDTO> powerUsageByDayDTOList = isPowerUsageResult.value!;
    List<GraphPointModel> graphPointModelList = <GraphPointModel>[];

    for (var i = 0; i < powerUsageByDayDTOList.length; i++) {
      graphPointModelList.add(GraphPointModel(
          powerUsageByDayDTOList[i].dateTimeKr,
          powerUsageByDayDTOList[i].powerUsageQuantity));
    }

    print(graphPointModelList);

    return Result.success(graphPointModelList);
  }
}
