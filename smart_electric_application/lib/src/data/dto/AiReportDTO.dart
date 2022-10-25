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
      required String dayOrNight,
      required double dayTimePowerUsage,
      required double nightTimePowerUsage,
      required double dayPowerUsageMean,
      required double dayPowerUsageMeanInWon,
      required double dayPowerUsageMin,
      required double dayPowerUsageMinInWon,
      required double dayPowerUsageMax,
      required double dayPowerUsageInWon}) = _AiReportDTO;
  factory AiReportDTO.fromJson(Map<String, dynamic> json) =>
      _$AiReportDTOFromJson(json);
}
