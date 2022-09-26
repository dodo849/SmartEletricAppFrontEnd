import 'package:freezed_annotation/freezed_annotation.dart';

part 'IsSaveEmailDTO.freezed.dart';
part 'IsSaveEmailDTO.g.dart';

@freezed
class IsSaveEmailDTO with _$IsSaveEmailDTO {
  factory IsSaveEmailDTO({
    required bool updated,
  }) = _IsSaveEmailDTO;

  factory IsSaveEmailDTO.fromJson(Map<String, dynamic> json) =>
      _$IsSaveEmailDTOFromJson(json);
}
