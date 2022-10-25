import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

part 'BillSimulationProductModel.freezed.dart';
part 'BillSimulationProductModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class BillSimulationProductModel with _$BillSimulationProductModel {
  factory BillSimulationProductModel(
      {required int order,
      required String productName,
      required String modelName,
      required ProductTypeModel productType,
      required double monthPowerUsage}) = _BillSimulationProductModel;

  factory BillSimulationProductModel.fromJson(Map<String, dynamic> json) =>
      _$BillSimulationProductModelFromJson(json);
}
