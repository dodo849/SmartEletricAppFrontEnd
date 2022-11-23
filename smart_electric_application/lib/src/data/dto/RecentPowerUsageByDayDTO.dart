import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';

part 'RecentPowerUsageByDayDTO.freezed.dart';
part 'RecentPowerUsageByDayDTO.g.dart';

@freezed
class RecentPowerUsageByDayDTO with _$RecentPowerUsageByDayDTO {
  factory RecentPowerUsageByDayDTO({
    required List<PowerUsageDTO> lastMonth,
    required List<PowerUsageDTO> secondLastMonth,
  }) = _RecentPowerUsageByDayDTO;

  factory RecentPowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =>
      _$RecentPowerUsageByDayDTOFromJson(json);
}
