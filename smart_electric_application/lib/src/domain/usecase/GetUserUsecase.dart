import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';

class GetUserUsecase {
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<UserModel, String>> execute() async {
    Result<String, String> name = await authRepository.getUserName()
      ..value;
    Result<String, String> email = await authRepository.getEmail();
    Result<String, String> customerNumber =
        await authRepository.getCustomerNumber();

    return Result.success(UserModel(
        name: name.value!,
        email: email.value!,
        customerNumber: customerNumber.value!));
  }
}
