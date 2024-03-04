import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/UserValidationDTO.dart';
import 'package:smart_electric_application/src/data/repository/InfoRepository.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface//AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/InfoRepositoryInterface.dart';

/// 정보제공 동의 확인
class CheckInfoAgreementUsecase {
  final infoRepository = GetIt.I.get<InfoRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<bool> execute() async {
    // 저장된 고객번호 가져오기
    // Result<String, String> customerNumberResult =
    //     await authRepository.getCustomerNumber();
    // 고객 정보 가져오기
    try {
      UserModel user =
          await authRepository.getUser();

      UserValidationDTO userValidationDTO =
          await infoRepository.checkInfoValidation(user.customerNumber);

      // 고객정보 동의 했는지 확인
      if (userValidationDTO.infoYn == 'Y') {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }
}
