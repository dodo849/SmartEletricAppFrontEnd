import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/PowerUsageRepositoryInterface.dart';

class GetPowerUsageOfYesterdayUsecase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<List<GraphPointModel>, String>> execute() async {
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure(
          "There is no customer number stored on the device.");
    }

    // 오늘, 어제 날짜 가져오기
    var today = DateTime.now().subtract(Duration(hours: DateTime.now().hour));
    var yesterday = today.subtract(const Duration(days: 1));

    // 날짜 형식 변경
    DateFormat formatter = DateFormat('yyyyMMddHH');
    var formattedToday = formatter.format(today);
    var formattedYesterday = formatter.format(yesterday);

    // 네트워크
    Result<List<PowerUsageDTO>, String> isPowerUsageResult =
        await powerUsageRepository.getPowerUsageByHour(
            customerNumber: getCustomerNumberResult.value!,
            startDate: formattedYesterday,
            endDate: formattedToday);

    // 예외 처리
    if (isPowerUsageResult.status == ResultStatus.error) {
      return Result.failure(isPowerUsageResult.error);
    }

    // Presentation Model로 바꾸기
    List<PowerUsageDTO> powerUsageByDayDTOList = isPowerUsageResult.value!;
    List<GraphPointModel> graphPointModelList = <GraphPointModel>[];

    // 서버스키마 dateTimeKr을 DateTime형으로 바꾸기
    DateFormat timeFormatter = DateFormat('H시');

    for (var i = 0; i < powerUsageByDayDTOList.length; i++) {
      graphPointModelList.add(GraphPointModel(
          timeFormatter
              .format(DateTime.parse(powerUsageByDayDTOList[i].dateTimeKr)),
          powerUsageByDayDTOList[i].powerUsageQuantity));
    }

    return Result.success(graphPointModelList);
  }
}
