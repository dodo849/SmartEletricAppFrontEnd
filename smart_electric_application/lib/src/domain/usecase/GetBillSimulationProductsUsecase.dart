import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';

class GetBillSimulationProductsUsecase {
  // GetIt으로 DI 교체 해야함
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<List<BillSimulationProductModel>, String>> execute() async {
    // 1. Get product list
    Result<String, String> getBillSimulationProductResult =
        await billSimulationRepository.getBillSimulationProduct();

    if (getBillSimulationProductResult.status == ResultStatus.error 
        ) {
      return Result.failure(getBillSimulationProductResult.error.toString());
    } else if (getBillSimulationProductResult.value == null) {
      return const Result.success(null);
    }

    // 2. Decode product list
    var billSimulationProducts =
        json.decode(getBillSimulationProductResult.value!);

    // 3. Convert json to model
    billSimulationProducts = billSimulationProducts
        .map((item) => BillSimulationProductModel.fromJson(item))
        .toList();

    return Result.success(billSimulationProducts);
  }
}
