import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountEmailValidationDTO.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';

abstract class AccountRepositoryInterface {
  Future<Result<bool, String>> requestRegisterAccount(
      {required AccountRegistrationDTO accountRegistrationDTO});
  Future<Result<AccountRegistrationDTO, String>> requestAccount(
      {required String email});
  Future<Result<AccountEmailValidationDTO, String>> requestEmailValidation(
      {required String email});
  Future<Result<AccountEmailValidationDTO, String>> requestActivateUser(
      {required String email});
}
