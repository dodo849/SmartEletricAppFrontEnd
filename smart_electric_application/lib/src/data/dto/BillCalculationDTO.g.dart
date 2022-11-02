// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillCalculationDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillCalculationDTO _$$_BillCalculationDTOFromJson(
        Map<String, dynamic> json) =>
    _$_BillCalculationDTO(
      result: (json['result'] as num).toDouble(),
      accumulate: json['accumulate'] as int,
      powerBillInfo: PowerBillInfoDTO.fromJson(
          json['powerBillInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BillCalculationDTOToJson(
        _$_BillCalculationDTO instance) =>
    <String, dynamic>{
      'result': instance.result,
      'accumulate': instance.accumulate,
      'powerBillInfo': instance.powerBillInfo,
    };

_$_PowerBillInfoDTO _$$_PowerBillInfoDTOFromJson(Map<String, dynamic> json) =>
    _$_PowerBillInfoDTO(
      powerAccumulateThresholdFirst:
          json['power_accumulate_threshold_first'] as int,
      powerAccumulateThresholdSecond:
          json['power_accumulate_threshold_second'] as int,
      powerAccumulateThresholdSuper:
          json['power_accumulate_threshold_super'] as int,
      baseBillFirst: json['base_bill_first'] as int,
      baseBillSecond: json['base_bill_second'] as int,
      baseBillThired: json['base_bill_third'] as int,
      powerBillFrist: (json['power_bill_first'] as num).toDouble(),
      powerBillSecond: (json['power_bill_second'] as num).toDouble(),
      powerBillThird: (json['power_bill_third'] as num).toDouble(),
      powerBillSuper: (json['power_bill_super'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PowerBillInfoDTOToJson(_$_PowerBillInfoDTO instance) =>
    <String, dynamic>{
      'power_accumulate_threshold_first':
          instance.powerAccumulateThresholdFirst,
      'power_accumulate_threshold_second':
          instance.powerAccumulateThresholdSecond,
      'power_accumulate_threshold_super':
          instance.powerAccumulateThresholdSuper,
      'base_bill_first': instance.baseBillFirst,
      'base_bill_second': instance.baseBillSecond,
      'base_bill_third': instance.baseBillThired,
      'power_bill_first': instance.powerBillFrist,
      'power_bill_second': instance.powerBillSecond,
      'power_bill_third': instance.powerBillThird,
      'power_bill_super': instance.powerBillSuper,
    };
