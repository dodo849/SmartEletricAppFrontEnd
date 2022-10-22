import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';

class GetSimulationProductsUsecase {
  // GetIt으로 DI 교체 해야함
    final billSimulationRepository = GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<dynamic, String>> execute(
      BillSimulationProductModel billSimulationProduct) async {
    // 1. Get product list
    Result<String, String> getBillSimulationProductResult =
        await billSimulationRepository.getBillSimulationProduct();

    if (getBillSimulationProductResult.status == ResultStatus.error) {
      return getBillSimulationProductResult;
    }

    // 2. Decode product list
    List<dynamic> billSimulationProducts =
        json.decode(getBillSimulationProductResult.value!);

    return Result.success(billSimulationProducts);
  }
}
