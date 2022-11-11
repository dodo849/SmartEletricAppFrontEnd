import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';

class AddBillSimulationProductUsecase {
  // GetIt으로 DI 교체 해야함
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<bool, String>> execute(
      BillSimulationProductModel billSimulationProduct) async {
    // 1. Get product list
    Result<String, String> getBillSimulationProductResult =
        await billSimulationRepository.getBillSimulationProduct();

    if (getBillSimulationProductResult.status == ResultStatus.error) {
      return Result.failure(getBillSimulationProductResult.error.toString());
    }

    // 시뮬레이션 기능 첫 이용시 null일 수 있음
    var billSimulationProductsJson;
    if (getBillSimulationProductResult.value != null) {
      // 2. Decode product list
      List<dynamic> billSimulationProducts =
          json.decode(getBillSimulationProductResult.value!);

      // 3. Add product to list
      billSimulationProducts.add(billSimulationProduct);

      // 4. Encode
      billSimulationProductsJson = json.encode(billSimulationProducts);
    } else {
      // 첫 이용시 추가한 프로덕트 하나만 인코딩
      billSimulationProductsJson = json.encode([billSimulationProduct]);
    }

    // 4. Save to storage
    var saveBillSimulationProductResult =
        await billSimulationRepository.saveBillSimulationProduct(
            billSimulationProducts: billSimulationProductsJson);

    if (saveBillSimulationProductResult.status == ResultStatus.success) {
      return Result.success(true);
    } else {
      return Result.failure(saveBillSimulationProductResult.error.toString());
      ;
    }
  }
}
