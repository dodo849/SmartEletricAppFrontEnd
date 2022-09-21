import 'package:freezed_annotation/freezed_annotation.dart';

part 'IsSmartMeterDTO.freezed.dart';
part 'IsSmartMeterDTO.g.dart';

@freezed
class IsSmartMeterDTO with _$IsSmartMeterDTO {
  factory IsSmartMeterDTO({
    required bool custNumValidation,
  }) = _IsSmartMeterDTO;

  factory IsSmartMeterDTO.fromJson(Map<String, dynamic> json) =>
      _$IsSmartMeterDTOFromJson(json);
}
