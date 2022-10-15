

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

/// 이메일 중복 확인 UseCase
class CheckEmailDuplicateUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> execute(String email) async {
    var result = await authRepository.checkEmailDuplicate(email);
    return result;
  }
}
