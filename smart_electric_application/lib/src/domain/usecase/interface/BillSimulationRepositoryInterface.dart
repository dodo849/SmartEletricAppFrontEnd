import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';

abstract class BillSimulationRepositoryInterface {
  Future<Result<List<BillSimulationProductModel>, String>>
      getBillSimulationProduct();
  Future<Result<bool, String>> saveBillSimulationProduct(
      {required BillSimulationProductModel billSimulationProduct});
  Future<Result<bool, String>> deleteBillSimulationProduct({required int id});
}
