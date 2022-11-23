import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/dto/UserValidationDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/InfoRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/InfoRepositoryInterface.dart';

class InfoRepository implements InfoRepositoryInterface {
  @override
  Future<UserValidationDTO> checkInfoValidation(String customerNumber) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = InfoRetrofit(dio);

      UserValidationDTO userValidationDTO =
          await retrofit.checkInfoValidation(customerNumber);

      return userValidationDTO;
    } catch (err) {
      rethrow;
    }
  }
}
