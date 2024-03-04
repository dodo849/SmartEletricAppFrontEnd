import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillSimulationRepositoryInterface.dart';

class DeleteBillSimulationProductsUsecase {
  final billSimulationRepository =
      GetIt.I.get<BillSimulationRepositoryInterface>();

  Future<Result<bool, String>> execute(List<int?> ids) async {
    for (var id in ids) {
      if (id != null) {
        Result<bool, String> deleteBillSimulationProductResult =
            await billSimulationRepository.deleteBillSimulationProduct(id: id);
      }
    }

    return const Result.success(true);
  }
}
