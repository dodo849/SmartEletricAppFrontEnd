// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillSimulationProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillSimulationProductModel _$$_BillSimulationProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_BillSimulationProductModel(
      id: json['id'] as int?,
      productName: json['productName'] as String,
      modelName: json['modelName'] as String,
      typeKrName: json['typeKrName'] as String,
      typeEngName: json['typeEngName'] as String,
      monthPowerUsage: (json['monthPowerUsage'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BillSimulationProductModelToJson(
        _$_BillSimulationProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'modelName': instance.modelName,
      'typeKrName': instance.typeKrName,
      'typeEngName': instance.typeEngName,
      'monthPowerUsage': instance.monthPowerUsage,
    };
