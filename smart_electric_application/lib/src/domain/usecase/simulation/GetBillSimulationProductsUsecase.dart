import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillSimulationRepositoryInterface.dart';

class GetBillSimulationProductsUsecase {
  // GetIt으로 DI 교체 해야함
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<List<BillSimulationProductModel>, String>> execute() async {
    // 1. Get product list
    Result<List<BillSimulationProductModel>, String>
        getBillSimulationProductResult =
        await billSimulationRepository.getBillSimulationProduct();

    return getBillSimulationProductResult;
  }
}
