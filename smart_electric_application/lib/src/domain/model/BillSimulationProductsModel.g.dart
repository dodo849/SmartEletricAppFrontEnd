// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillSimulationProductsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillSimulationProductsModel _$$_BillSimulationProductsModelFromJson(
        Map<String, dynamic> json) =>
    _$_BillSimulationProductsModel(
      billSimulationProducts: (json['billSimulationProducts'] as List<dynamic>)
          .map((e) =>
              BillSimulationProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BillSimulationProductsModelToJson(
        _$_BillSimulationProductsModel instance) =>
    <String, dynamic>{
      'billSimulationProducts': instance.billSimulationProducts,
    };
