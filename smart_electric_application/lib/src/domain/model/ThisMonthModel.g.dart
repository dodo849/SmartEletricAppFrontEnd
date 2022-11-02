// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThisMonthModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThisMonthModel _$$_ThisMonthModelFromJson(Map<String, dynamic> json) =>
    _$_ThisMonthModel(
      userName: json['userName'] as String,
      powerUsage: (json['powerUsage'] as num).toDouble(),
      bill: (json['bill'] as num).toDouble(),
      progressiveSection: json['progressiveSection'] as int,
      accumulateThresholdFirst: json['accumulateThresholdFirst'] as int,
      accumulateThresholdSecond: json['accumulateThresholdSecond'] as int,
      accumulateThresholdSuper: json['accumulateThresholdSuper'] as int,
      predictionPowerUsage: (json['predictionPowerUsage'] as num).toDouble(),
      predictionBill: (json['predictionBill'] as num).toDouble(),
      predictionProgressiveSection: json['predictionProgressiveSection'] as int,
    );

Map<String, dynamic> _$$_ThisMonthModelToJson(_$_ThisMonthModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'powerUsage': instance.powerUsage,
      'bill': instance.bill,
      'progressiveSection': instance.progressiveSection,
      'accumulateThresholdFirst': instance.accumulateThresholdFirst,
      'accumulateThresholdSecond': instance.accumulateThresholdSecond,
      'accumulateThresholdSuper': instance.accumulateThresholdSuper,
      'predictionPowerUsage': instance.predictionPowerUsage,
      'predictionBill': instance.predictionBill,
      'predictionProgressiveSection': instance.predictionProgressiveSection,
    };
