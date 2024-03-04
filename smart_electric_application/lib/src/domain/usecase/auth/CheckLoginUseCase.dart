import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';


/// 로그인 상태인지 확인. true이면 로그인 상태, false이면 로그인 필요
class CheckLoginUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> execute() async {
    Result<bool, String> isLogin = await authRepository.checkLogin();

    if (isLogin.status == ResultStatus.error) {
      return const Result.success(false);
    } else {
      return Result.success(isLogin.value!);
    }
  }
}
