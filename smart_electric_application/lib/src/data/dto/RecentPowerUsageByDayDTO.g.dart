// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecentPowerUsageByDayDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentPowerUsageByDayDTO _$$_RecentPowerUsageByDayDTOFromJson(
        Map<String, dynamic> json) =>
    _$_RecentPowerUsageByDayDTO(
      lastMonth: (json['lastMonth'] as List<dynamic>)
          .map((e) => PowerUsageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondLastMonth: (json['secondLastMonth'] as List<dynamic>)
          .map((e) => PowerUsageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecentPowerUsageByDayDTOToJson(
        _$_RecentPowerUsageByDayDTO instance) =>
    <String, dynamic>{
      'lastMonth': instance.lastMonth,
      'secondLastMonth': instance.secondLastMonth,
    };
