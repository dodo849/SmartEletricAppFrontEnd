import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';

/// Server Authentication Repository Interface
abstract class AuthRepositoryInterface {
  Future<Result<JwtTokenDTO, String>> getJwtTokens(String firebaseIdToken);
  Future<Result<bool, String>> saveJwtTokenToDB(JwtTokenDTO tokens);
  Future<Result<bool, String>> checkEmailDuplicate(String email);
  Future<Result<bool, String>> saveUserToDB({
      required String customerNumber, required String name, required String email});
}
