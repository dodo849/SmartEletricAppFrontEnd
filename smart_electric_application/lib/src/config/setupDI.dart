// Dependency Injection (DI)
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

void setupDI() {
  GetIt.I.registerSingleton<FirebaseRepositoryInterface>(FirebaseRepository());
  GetIt.I.registerSingleton<AuthRepositoryInterface>(AuthRepository());
}