import 'package:smart_electric_application/src/data/dto/UserValidationDTO.dart';

abstract class InfoRepositoryInterface {
  Future<UserValidationDTO> checkInfoValidation(String customerNumber);
}
