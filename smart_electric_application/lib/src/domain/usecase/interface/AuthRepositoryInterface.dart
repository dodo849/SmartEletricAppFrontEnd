import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';

/// Server Authentication Repository Interface
abstract class AuthRepositoryInterface {
  Future<Result<JwtTokenDTO, Exception>> getJwtTokens(String firebaseIdToken);
  Future<Result<bool, Exception>> saveJwtTokenTnDB(JwtTokenDTO tokens);
}
