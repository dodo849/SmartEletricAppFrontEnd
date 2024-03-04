import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillRepositoryInterface.dart';

class GetAddressUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<String?, String>> execute() async {

    Result<String?, String> addressResult = await authRepository.getAddress();

    if(addressResult.status == ResultStatus.error){
      return Result.failure(addressResult.error.toString());
    }

    return Result.success(addressResult.value);
  }
}
