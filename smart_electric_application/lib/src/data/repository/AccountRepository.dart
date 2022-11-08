import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountEmailValidationDTO.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AccountRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';

/// 요금 시뮬레이션 관련 레포지토리
class AccountRepository implements AccountRepositoryInterface {
  @override
  Future<Result<bool, String>> requestRegisterAccount(
      {required AccountRegistrationDTO accountRegistrationDTO}) async {
    try {
      final dio = Dio();
      final accountRetrofit = AccountRetrofit(dio);

      await accountRetrofit.registerNewAcoount(accountRegistrationDTO);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<AccountRegistrationDTO, String>> requestAccount(
      {required String email}) async {
    try {
      final dio = await getInterceptorDio();
      final accountRetrofit = AccountRetrofit(dio);

      AccountRegistrationDTO accountRegistrationDTO =
          await accountRetrofit.getAccountRegistration(email);

      return Result.success(accountRegistrationDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<AccountEmailValidationDTO, String>> requestEmailValidation(
      {required String email}) async {
    try {
      final dio = Dio();
      final accountRetrofit = AccountRetrofit(dio);

      AccountEmailValidationDTO accountEmailValidationDTO =
          await accountRetrofit.getEmailValidation(email);

      return Result.success(accountEmailValidationDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
