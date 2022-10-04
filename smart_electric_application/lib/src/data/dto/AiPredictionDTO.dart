import 'package:freezed_annotation/freezed_annotation.dart';

part 'AiPredictionDTO.freezed.dart';
part 'AiPredictionDTO.g.dart';

@freezed
class AiPredictionDTO with _$AiPredictionDTO {
  factory AiPredictionDTO({required List<DailyPrediction> prediction}) =
      _AiPredictionDTO;

  factory AiPredictionDTO.fromJson(Map<String, dynamic> json) =>
      _$AiPredictionDTOFromJson(json);
}

@freezed
class DailyPrediction with _$DailyPrediction {
  factory DailyPrediction(
      {required String dateTimeKr,
      required double powerUsageQuantity}) = __DailyPrediction;

  factory DailyPrediction.fromJson(Map<String, dynamic> json) =>
      _$DailyPredictionFromJson(json);
}
