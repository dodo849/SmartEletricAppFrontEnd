import 'package:freezed_annotation/freezed_annotation.dart';

part 'AiReportDTO.freezed.dart';
part 'AiReportDTO.g.dart';

@freezed
class AiReportDTO with _$AiReportDTO {
  factory AiReportDTO(
      {required List<int> timePeriodIndex,
      required List<double> timePeriodPowerUsage,
      required double standbyPower,
      required List<int> weekdayIndex,
      required List<double> weekdayPowerUsage,
      required double dayPowerUsageMean,
      required double dayPowerUsageMin,
      required double dayPowerUsageMax}) = _AiReportDTO;
  factory AiReportDTO.fromJson(Map<String, dynamic> json) =>
      _$AiReportDTOFromJson(json);
}
