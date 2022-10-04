// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PowerUsageByDayDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PowerUsageByDayDTO _$$_PowerUsageByDayDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PowerUsageByDayDTO(
      dateTimeKr: json['dateTimeKr'] as String,
      powerUsageQuantity: (json['powerUsageQuantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PowerUsageByDayDTOToJson(
        _$_PowerUsageByDayDTO instance) =>
    <String, dynamic>{
      'dateTimeKr': instance.dateTimeKr,
      'powerUsageQuantity': instance.powerUsageQuantity,
    };
