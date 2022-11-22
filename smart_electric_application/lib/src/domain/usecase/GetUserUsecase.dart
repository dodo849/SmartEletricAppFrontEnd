import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillRepositoryInterface.dart';

class GetUserUsecase {
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();
  final billRepository = GetIt.I.get<BillRepositoryInterface>();

  Future<Result<UserModel, String>> execute() async {

    try {
    UserModel user = await authRepository.getUser();

    return Result.success(user);

    } catch (error) {
      return Result.failure(error.toString());
    }
  }
}
