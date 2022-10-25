// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiReportDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AiReportDTO _$$_AiReportDTOFromJson(Map<String, dynamic> json) =>
    _$_AiReportDTO(
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
      dayPowerUsageInWon: (json['dayPowerUsageInWon'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AiReportDTOToJson(_$_AiReportDTO instance) =>
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
      'dayPowerUsageInWon': instance.dayPowerUsageInWon,
    };
