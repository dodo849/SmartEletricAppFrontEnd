import 'package:freezed_annotation/freezed_annotation.dart';

part 'PowerUsageByDayDTO.freezed.dart';
part 'PowerUsageByDayDTO.g.dart';

@freezed
class PowerUsageByDayDTO with _$PowerUsageByDayDTO {
  factory PowerUsageByDayDTO({
    required String dateTimeKr,
    required double powerUsageQuantity,
  }) = _PowerUsageByDayDTO;

  factory PowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =>
      _$PowerUsageByDayDTOFromJson(json);
}
