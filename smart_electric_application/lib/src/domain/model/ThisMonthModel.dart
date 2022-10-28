import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

part 'ThisMonthModel.freezed.dart';
part 'ThisMonthModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class ThisMonthModel with _$ThisMonthModel {
  factory ThisMonthModel(
      {required String userName,
      required double powerUsage,
      required int bill,
      required int progressiveSection,
      required int accumulateThresholdFirst,
      required int accumulateThresholdSecond,
      required int accumulateThresholdSuper,
      required double predictionPowerUsage,
      required int predictionBill,
      required int predictedProgressiveSection,
      }) = _ThisMonthModel;

  factory ThisMonthModel.fromJson(Map<String, dynamic> json) =>
      _$ThisMonthModelFromJson(json);
}
