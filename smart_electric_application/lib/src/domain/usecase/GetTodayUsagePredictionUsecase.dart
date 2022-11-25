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

  Result<DailyPrediction, String> execute(AiPredictionDTO aiPrediction) {

    // 오늘 날짜 받아오기
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    var strToday = formatter.format(now);

    // 오늘 예측값 찾기
    for (var dailyPrediction in aiPrediction.prediction) {
      if (dailyPrediction.dateTimeKr == strToday){
        return Result.success(dailyPrediction);
      }
    } 

    // 만약 오늘 값 없으면 마지막 값 리턴
    var lastPreiction = aiPrediction.prediction[aiPrediction.prediction.length-1];

    return Result.success(lastPreiction);
  }
}
