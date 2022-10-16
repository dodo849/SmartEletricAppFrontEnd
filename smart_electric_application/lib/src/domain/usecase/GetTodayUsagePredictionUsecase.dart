import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';

/// 오늘 예측 값 가져오기
class GetTodayUsagePredictionUsecase {
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<dynamic, String>> excute(AiPredictionDTO aiPredictionDTO) async {

    // 오늘 날짜 받아오기
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    var strToday = formatter.format(now);

    // 오늘 예측값 찾기
    for (var dailyPrediction in aiPredictionDTO.prediction) {
      if (dailyPrediction.dateTimeKr == strToday){
        return Result.success(dailyPrediction);
      }
    }

    return Result.failure("Today's usage prediction was not found.");
  }
}
