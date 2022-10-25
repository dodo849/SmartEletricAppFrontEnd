import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';

class RemoveBillSimulationProductsUsecase {
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<dynamic, String>> execute(List<int> removeProducts) async {
    // 1. Get product list
    Result<String, String> getBillSimulationProductResult =
        await billSimulationRepository.getBillSimulationProduct();

    if (getBillSimulationProductResult.status == ResultStatus.error) {
      return Result.failure(getBillSimulationProductResult.error.toString());
    }

    // 2. Decode product list
    List<dynamic> billSimulationProducts =
        json.decode(getBillSimulationProductResult.value!);

    // 3. Remove products
    for (var index in removeProducts) {
      billSimulationProducts.removeAt(index);
    }

    // 4. Encode
    var billSimulationProductsJson = json.encode(billSimulationProducts);

    // 4. Save to storage
    var saveBillSimulationProductResult =
        await billSimulationRepository.saveBillSimulationProduct(
            billSimulationProducts: billSimulationProductsJson);

    if (saveBillSimulationProductResult.status == ResultStatus.success) {
      return Result.success(true);
    } else {
      return Result.failure(saveBillSimulationProductResult.error.toString());
    }
  }
}
