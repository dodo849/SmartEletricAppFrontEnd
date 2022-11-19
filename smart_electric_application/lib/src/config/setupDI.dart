// Dependency Injection (DI)
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/repository/AccountRepository.dart';
import 'package:smart_electric_application/src/data/repository/AiRepository.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/data/repository/DefaultRepository.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/data/repository/InfoRepository.dart';
import 'package:smart_electric_application/src/data/repository/PowerUsageRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/DefaultRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/InfoRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

void setupDI() {
  GetIt.I.registerSingleton<FirebaseRepositoryInterface>(FirebaseRepository());
  GetIt.I.registerSingleton<AuthRepositoryInterface>(AuthRepository());
  GetIt.I.registerSingleton<DefaultRepositoryInterface>(DefaultRepository());
  GetIt.I
      .registerSingleton<PowerUsageRepositoryInterface>(PowerUsageRepository());
  GetIt.I.registerSingleton<AiRepositoryInterface>(AiRepository());
  GetIt.I.registerSingleton<BillSimulationRepositoryInterface>(
      BillSimulationRepository());
  GetIt.I.registerSingleton<AccountRepositoryInterface>(AccountRepository());
  GetIt.I.registerSingleton<InfoRepositoryInterface>(InfoRepository());
}
