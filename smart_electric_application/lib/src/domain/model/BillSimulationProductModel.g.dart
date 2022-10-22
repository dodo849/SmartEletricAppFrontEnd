// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillSimulationProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillSimulationProductModel _$$_BillSimulationProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_BillSimulationProductModel(
      productName: json['productName'] as String,
      modelName: json['modelName'] as String,
      productType: ProductTypeModel.fromJson(
          json['productType'] as Map<String, dynamic>),
      monthPowerUsage: (json['monthPowerUsage'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BillSimulationProductModelToJson(
        _$_BillSimulationProductModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'modelName': instance.modelName,
      'productType': instance.productType,
      'monthPowerUsage': instance.monthPowerUsage,
    };
