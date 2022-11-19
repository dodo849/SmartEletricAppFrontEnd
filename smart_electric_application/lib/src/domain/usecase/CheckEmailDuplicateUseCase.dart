import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountEmailValidationDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';

/// 이메일 중복 확인 UseCase
class CheckEmailDuplicateUsecase {
  final accountRepository = GetIt.I.get<AccountRepositoryInterface>();

  Future<Result<AccountEmailValidationDTO, String>> execute(
      String email) async {
    Result<AccountEmailValidationDTO, String> requestEmailValidationResult =
        await accountRepository.requestEmailValidation(email: email);

    return requestEmailValidationResult;
  }
}
