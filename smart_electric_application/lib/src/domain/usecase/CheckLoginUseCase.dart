import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/SmartMeterDTO.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';

class CheckLoginUseCase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> excute(customerNumber) async {
    var readTokensResult =
        await authRepository.readTokens();

    if(readTokensResult.status == ResultStatus.error) {
      return const Result.success(true);
    }
    else {
      return const Result.success(false);
    }
  }
}
