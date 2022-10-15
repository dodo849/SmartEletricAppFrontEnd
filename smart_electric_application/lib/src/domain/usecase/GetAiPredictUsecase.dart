import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';

/// Ai 예측 값 받아오기
class GetAiPredictUsecase {
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();

  // Future<Result<bool, String>> excute() async {
  //   // var readTokensResult =
  //   //     await aiRepository.getAiPrediction(customerNumber: );

  //   // if(readTokensResult.status == ResultStatus.error) {
  //   //   return const Result.success(false);
  //   // }
  //   // else {
  //   //   return const Result.success(true);
  //   // }
  // }
}
