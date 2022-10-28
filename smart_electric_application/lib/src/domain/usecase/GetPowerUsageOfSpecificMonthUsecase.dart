import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

class GetPowerUsageOfSpecificMonthUsecase {
  final PowerUsageRepositoryInterface powerUsageRepository =
      GetIt.I.get<PowerUsageRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();

  // Usecase

  Future<Result<PowerUsageDTO, String>> execute(DateTime date) async {
    
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("Failed to get customer number");
    }

    // 날짜 형식 변경
    DateFormat formatter = DateFormat('yyyyMM');
    var thisMonth = formatter.format(date);

    // 네트워크
    Result<List<PowerUsageDTO>, String> isPowerUsageResult =
        await powerUsageRepository.getPowerUsageByMonth(
            customerNumber: getCustomerNumberResult.value!,
            startDate: thisMonth,
            endDate: thisMonth);

    if (isPowerUsageResult.status == ResultStatus.error) {
      return Result.failure(isPowerUsageResult.error);
    }

    for (var powerUsage in isPowerUsageResult.value!) {
      // 리스트 요소의 endDataKr를 내부 DateTime 형으로 변경
      var elementDate = DateTime.parse(powerUsage.endDateKr);

      // 연도 비교해서 이번달 사용정보이면 return
      if (elementDate.month == date.month) {
        return Result.success(powerUsage);
      }
    }

    // 이번달 정보 못찾으면 fail
    return Result.failure("not found");
  }
}
