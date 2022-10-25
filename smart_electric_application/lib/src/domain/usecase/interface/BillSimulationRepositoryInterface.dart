import 'package:smart_electric_application/src/config/Result.dart';

abstract class BillSimulationRepositoryInterface {
Future<Result<bool, String>> saveBillSimulationProduct(
      {required String billSimulationProducts});
Future<Result<String, String>> getBillSimulationProduct();
}
