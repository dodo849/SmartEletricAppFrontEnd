import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';

/// Server Authentication Repository Interface
abstract class AuthRepositoryInterface {
  Future<Result<JwtTokenDTO, String>> requestJwt(String firebaseIdToken);
  Future<Result<JwtTokenDTO, String>> getJwt();
  Future<Result<bool, String>> saveJwt(JwtTokenDTO tokens);
  Future<Result<bool, String>> removeJwt();
  Future<Result<bool, String>> checkEmailDuplicate(String email);
  Future<Result<bool, String>> saveEmail(String email);
  Future<Result<bool, String>> saveUser(
      {required String customerNumber,
      required String name,
      required String email,
      required bool isSmartMeter});
  Future<UserModel> getUser();
  Future<Result<String, String>> getCustomerNumber();
  Future<Result<bool, String>> removeEmail(email);
  Future<Result<String, String>> getEmail();
  Future<Result<bool, String>> removeUser();
  Future<Result<String, String>> getUserName();
  Future<Result<bool, String>> getIsSmartMeter();
}
