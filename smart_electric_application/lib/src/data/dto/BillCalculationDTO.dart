import 'package:freezed_annotation/freezed_annotation.dart';

part 'BillCalculationDTO.freezed.dart';

part 'BillCalculationDTO.g.dart';

/// --
///
/// - [result] 계산된 요금 (원)
/// - [accumulate] 누진 구간 정보 (1단계: 0, 2단계: 1, 3단계: 2)
/// - [powerBillInfo] 누진구간 정보
@freezed
class BillCalculationDTO with _$BillCalculationDTO {
  factory BillCalculationDTO(
      {required double result,
      required int accumulate,
      required PowerBillInfoDTO powerBillInfo}) = _BillCalculationDTO;

  factory BillCalculationDTO.fromJson(Map<String, dynamic> json) =>
      _$BillCalculationDTOFromJson(json);
}

/// 누진 구간 정보 (계절 별 상이)
///
/// - [powerAccumulateThresholdFirst] 누진구간 1단계 임계값 (e.g. 200kWh -> 200)
/// - [powerAccumulateThresholdSecond] 누진구간 2단계 임계값 (e.g. 400kWh -> 400)
/// - [powerAccumulateThresholdSuper] 누진구간 3단계 임계값 (e.g. 1000kWh -> 1000)
/// - [baseBillFirst] 누진구간 1단계 기본요금 (원/kW)
/// - [baseBillSecond] 누진구간 2단계 기본요금 (원/kW)
/// - [baseBillThired] 누진구간 3단계 기본요금 (원/kW)
/// - [powerBillFrist] 누진구간 1단계 전력량 요금 (원/kWh)
/// - [powerBillSecond] 누진구간 2단계 전력량 요금 (원/kWh)
/// - [powerBillThird] 누진구간 3단계 전력량 요금 (원/kWh)
/// - [powerBillSuper] 누진구간 4단계 전력량 요금 (원/kWh)
@freezed
class PowerBillInfoDTO with _$PowerBillInfoDTO {
  factory PowerBillInfoDTO(
      {@JsonKey(name: "power_accumulate_threshold_first")
          required int powerAccumulateThresholdFirst,
      @JsonKey(name: "power_accumulate_threshold_second")
          required int powerAccumulateThresholdSecond,
      @JsonKey(name: "power_accumulate_threshold_super")
          required int powerAccumulateThresholdSuper,
      @JsonKey(name: "base_bill_first")
          required int baseBillFirst,
      @JsonKey(name: "base_bill_second")
          required int baseBillSecond,
      @JsonKey(name: "base_bill_third")
          required int baseBillThired,
      @JsonKey(name: "power_bill_first")
          required double powerBillFrist,
      @JsonKey(name: "power_bill_second")
          required double powerBillSecond,
      @JsonKey(name: "power_bill_third")
          required double powerBillThird,
      @JsonKey(name: "power_bill_super")
          required double powerBillSuper}) = _PowerBillInfoDTO;

  factory PowerBillInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$PowerBillInfoDTOFromJson(json);
}
