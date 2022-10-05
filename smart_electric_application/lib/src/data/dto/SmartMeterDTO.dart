import 'package:freezed_annotation/freezed_annotation.dart';

part 'SmartMeterDTO.freezed.dart';
part 'SmartMeterDTO.g.dart';

@freezed
class SmartMeterDTO with _$SmartMeterDTO {
  factory SmartMeterDTO({
    required bool custNumValidation,
  }) = _SmartMeterDTO;

  factory SmartMeterDTO.fromJson(Map<String, dynamic> json) =>
      _$SmartMeterDTOFromJson(json);
}
