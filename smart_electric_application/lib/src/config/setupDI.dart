// Dependency Injection (DI)
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/repository/AiRepository.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/data/repository/DefaultRepository.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/data/repository/PowerUsageRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

void setupDI() {
  GetIt.I.registerSingleton<FirebaseRepositoryInterface>(FirebaseRepository());
  GetIt.I.registerSingleton<AuthRepositoryInterface>(AuthRepository());
  GetIt.I.registerSingleton<DefaultRepositoryInterface>(DefaultRepository());
  GetIt.I
      .registerSingleton<PowerUsageRepositoryInterface>(PowerUsageRepository());
    GetIt.I
      .registerSingleton<AiRepositoryInterface>(AiRepository());
}
