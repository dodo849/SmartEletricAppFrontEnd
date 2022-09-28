import 'package:freezed_annotation/freezed_annotation.dart';

part 'PowerUsageByDayDTO.freezed.dart';
part 'PowerUsageByDayDTO.g.dart';

@freezed
class PowerUsageByDayDTO with _$PowerUsageByDayDTO {
  factory PowerUsageByDayDTO({
    required String dateTimeKr,
    required String powerUsageQuantity,
  }) = _PowerUsageByDayDTO;

factory List<Map<String, dynamic>> serializeTaskList(List<PowerUsageByDayDTO> objects) =>
    objects.map((e) => e.toJson()).toList();

  factory PowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =>
      _$PowerUsageByDayDTOFromJson(json);
}
