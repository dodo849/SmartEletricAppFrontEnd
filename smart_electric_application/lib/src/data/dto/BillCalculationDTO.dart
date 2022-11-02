import 'package:freezed_annotation/freezed_annotation.dart';

part 'BillCalculationDTO.freezed.dart';
part 'BillCalculationDTO.g.dart';

///
@freezed
class BillCalculationDTO with _$BillCalculationDTO {
  factory BillCalculationDTO(
      {required double result,
      required int accumulate,
      required PowerBillInfoDTO powerBillInfo}) = _BillCalculationDTO;
  factory BillCalculationDTO.fromJson(Map<String, dynamic> json) =>
      _$BillCalculationDTOFromJson(json);
}

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
