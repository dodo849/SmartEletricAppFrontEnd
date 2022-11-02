// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiReportModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AiReportModel _$$_AiReportModelFromJson(Map<String, dynamic> json) =>
    _$_AiReportModel(
      timePeriodIndex: (json['timePeriodIndex'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      timePeriodPowerUsage: (json['timePeriodPowerUsage'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      standbyPower: (json['standbyPower'] as num).toDouble(),
      weekdayIndex:
          (json['weekdayIndex'] as List<dynamic>).map((e) => e as int).toList(),
      weekdayPowerUsage: (json['weekdayPowerUsage'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      dayOrNight: json['dayOrNight'] as String,
      dayTimePowerUsage: (json['dayTimePowerUsage'] as num).toDouble(),
      nightTimePowerUsage: (json['nightTimePowerUsage'] as num).toDouble(),
      dayPowerUsageMean: (json['dayPowerUsageMean'] as num).toDouble(),
      dayPowerUsageMeanInWon:
          (json['dayPowerUsageMeanInWon'] as num).toDouble(),
      dayPowerUsageMin: (json['dayPowerUsageMin'] as num).toDouble(),
      dayPowerUsageMinInWon: (json['dayPowerUsageMinInWon'] as num).toDouble(),
      dayPowerUsageMax: (json['dayPowerUsageMax'] as num).toDouble(),
      dayPowerUsageMaxInWon: (json['dayPowerUsageMaxInWon'] as num).toDouble(),
      predictionBill: (json['predictionBill'] as num).toDouble(),
      predictionPowerUsage: (json['predictionPowerUsage'] as num).toDouble(),
      predictionSection: json['predictionSection'] as int,
    );

Map<String, dynamic> _$$_AiReportModelToJson(_$_AiReportModel instance) =>
    <String, dynamic>{
      'timePeriodIndex': instance.timePeriodIndex,
      'timePeriodPowerUsage': instance.timePeriodPowerUsage,
      'standbyPower': instance.standbyPower,
      'weekdayIndex': instance.weekdayIndex,
      'weekdayPowerUsage': instance.weekdayPowerUsage,
      'dayOrNight': instance.dayOrNight,
      'dayTimePowerUsage': instance.dayTimePowerUsage,
      'nightTimePowerUsage': instance.nightTimePowerUsage,
      'dayPowerUsageMean': instance.dayPowerUsageMean,
      'dayPowerUsageMeanInWon': instance.dayPowerUsageMeanInWon,
      'dayPowerUsageMin': instance.dayPowerUsageMin,
      'dayPowerUsageMinInWon': instance.dayPowerUsageMinInWon,
      'dayPowerUsageMax': instance.dayPowerUsageMax,
      'dayPowerUsageMaxInWon': instance.dayPowerUsageMaxInWon,
      'predictionBill': instance.predictionBill,
      'predictionPowerUsage': instance.predictionPowerUsage,
      'predictionSection': instance.predictionSection,
    };
