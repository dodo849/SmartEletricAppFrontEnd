import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillRepositoryInterface.dart';

class SaveAddressUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<bool, String>> execute(String address) async {

    await authRepository.saveAddress(address);

    return Result.success(true);
  }
}
