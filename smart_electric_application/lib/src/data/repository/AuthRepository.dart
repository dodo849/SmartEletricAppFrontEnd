import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AuthRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getDefaultDio.dart';

class AuthRepository {

  Future<bool> setJwtTokenDTOInDB(firebaseIdToken) async {
    final dio = await getDefaultDio(); // Provide a dio instance
    final retrofit = AuthRetrofit(dio);

    JwtTokenDTO jwtTokenDTO = await retrofit.getTokens(firebaseIdToken);



    return false;
    
  }
}
