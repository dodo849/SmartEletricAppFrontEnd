import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillSimulationRepositoryInterface.dart';

class AddBillSimulationProductUsecase {
  // GetIt으로 DI 교체 해야함
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<bool, String>> execute(
      BillSimulationProductModel billSimulationProduct) async {
    // 1. Save product
    Result<bool, String> getBillSimulationProductResult =
        await billSimulationRepository.saveBillSimulationProduct(
            billSimulationProduct: billSimulationProduct);

    return Result.failure(getBillSimulationProductResult.error.toString());
  }
}
