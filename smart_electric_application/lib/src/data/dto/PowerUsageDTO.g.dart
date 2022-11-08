// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PowerUsageDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PowerUsageDTO _$$_PowerUsageDTOFromJson(Map<String, dynamic> json) =>
    _$_PowerUsageDTO(
      startDateKr: json['startDateKr'] as String?,
      endDateKr: json['endDateKr'] as String?,
      dateTimeKr: json['dateTimeKr'] as String,
      powerUsageQuantity: (json['powerUsageQuantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PowerUsageDTOToJson(_$_PowerUsageDTO instance) =>
    <String, dynamic>{
      'startDateKr': instance.startDateKr,
      'endDateKr': instance.endDateKr,
      'dateTimeKr': instance.dateTimeKr,
      'powerUsageQuantity': instance.powerUsageQuantity,
    };
