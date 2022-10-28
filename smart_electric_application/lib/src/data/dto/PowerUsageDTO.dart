import 'package:freezed_annotation/freezed_annotation.dart';

part 'PowerUsageDTO.freezed.dart';
part 'PowerUsageDTO.g.dart';

@freezed
class PowerUsageDTO with _$PowerUsageDTO {
  factory PowerUsageDTO({
    required String startDateKr,
    required String endDateKr,
    required String dateTimeKr,
    required double powerUsageQuantity,
  }) = _PowerUsageDTO;

  factory PowerUsageDTO.fromJson(Map<String, dynamic> json) =>
      _$PowerUsageDTOFromJson(json);
}
