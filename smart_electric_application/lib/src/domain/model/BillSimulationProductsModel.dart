import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';

part 'BillSimulationProductsModel.freezed.dart';
part 'BillSimulationProductsModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class BillSimulationProductsModel with _$BillSimulationProductsModel {
  factory BillSimulationProductsModel({required List<BillSimulationProductModel> billSimulationProducts}) =
      _BillSimulationProductsModel;

  factory BillSimulationProductsModel.fromJson(Map<String, dynamic> json) =>
      _$BillSimulationProductsModelFromJson(json);
}