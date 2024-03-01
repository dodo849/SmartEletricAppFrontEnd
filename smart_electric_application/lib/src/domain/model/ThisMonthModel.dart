import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

part 'ThisMonthModel.freezed.dart';
part 'ThisMonthModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
///
/// - [userName] : 로그인된 사용자 정보
/// - [powerUsage] : 현재 사용량 (단위: kWh)
/// - [bill] : 현재 요금
/// - [progressiveSection] : 현재 누진 구간
/// - [accumulateThresholdFirst] : 첫번째 누진구간 임계값
/// - [accumulateThresholdSecond] : 두번째 누진구간 임계값
/// - [accumulateThresholdSuper] : 마지막 누진구간 임계값
/// - [predictionPowerUsage] : 이번달 예상 사용량
/// - [predictionBill] : 이번달 예상 요금
/// - [predictionProgressiveSection] : 이번달 예상 구간
@freezed
class ThisMonthModel with _$ThisMonthModel {
  factory ThisMonthModel(
      {required String userName,
      required double powerUsage,
      required double bill,
      required int progressiveSection,
      required int accumulateThresholdFirst,
      required int accumulateThresholdSecond,
      required int accumulateThresholdSuper,
      required double predictionPowerUsage,
      required double predictionBill,
      required int predictionProgressiveSection,
      }) = _ThisMonthModel;

  factory ThisMonthModel.fromJson(Map<String, dynamic> json) =>
      _$ThisMonthModelFromJson(json);
}
