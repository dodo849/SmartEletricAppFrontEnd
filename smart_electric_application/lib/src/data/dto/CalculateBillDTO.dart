import 'package:freezed_annotation/freezed_annotation.dart';

part 'CalculateBillDTO.freezed.dart';
part 'CalculateBillDTO.g.dart';

///
@freezed
class CalculateBillDTO with _$CalculateBillDTO {
  factory CalculateBillDTO(
      {required int result,
      required int accumulate,
      required PowerBillInfoDTO powerBillInfo}) = _CalculateBillDTO;
  factory CalculateBillDTO.fromJson(Map<String, dynamic> json) =>
      _$CalculateBillDTOFromJson(json);
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
          required int powerBillFrist,
      @JsonKey(name: "power_bill_second")
          required int powerBillSecond,
      @JsonKey(name: "power_bill_third")
          required int powerBillThird,
      @JsonKey(name: "power_bill_super")
          required int powerBillSuper}) = _PowerBillInfoDTO;
  factory PowerBillInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$PowerBillInfoDTOFromJson(json);
}
