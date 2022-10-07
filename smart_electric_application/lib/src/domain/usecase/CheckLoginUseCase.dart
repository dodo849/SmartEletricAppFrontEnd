import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

/// 로그인 상태인지 확인. true이면 로그인 상태, false이면 로그인 필요
class CheckLoginUseCase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> excute() async {
    var readTokensResult =
        await authRepository.readTokens();

    if(readTokensResult.status == ResultStatus.error) {
      return const Result.success(false);
    }
    else {
      return const Result.success(true);
    }
  }
}
