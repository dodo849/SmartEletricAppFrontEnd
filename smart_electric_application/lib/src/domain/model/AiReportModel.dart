import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

part 'AiReportModel.freezed.dart';
part 'AiReportModel.g.dart';

/// Ai Report View에 필요한 로직


@freezed
class AiReportModel with _$AiReportModel {
  factory AiReportModel(
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
      required double dayPowerUsageMaxInWon,

      required double predictionBill,
      required double predictionPowerUsage,
      required int predictionSection,
      }) = _AiReportModel;

  factory AiReportModel.fromJson(Map<String, dynamic> json) =>
      _$AiReportModelFromJson(json);
}
