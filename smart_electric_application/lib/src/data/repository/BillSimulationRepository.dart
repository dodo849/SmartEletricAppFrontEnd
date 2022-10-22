import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';

/// 요금 시뮬레이션 관련 레포지토리
class BillSimulationRepository implements BillSimulationRepositoryInterface{
  @override
  Future<Result<bool, String>> saveBillSimulationProduct(
      {required String billSimulationProducts}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('billSimulationProducts', billSimulationProducts);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<String, String>> getBillSimulationProduct() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? billSimulationProducts =
          prefs.getString('billSimulationProducts');

      return Result.success(billSimulationProducts);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
