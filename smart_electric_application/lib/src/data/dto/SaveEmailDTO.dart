import 'package:freezed_annotation/freezed_annotation.dart';

part 'SaveEmailDTO.freezed.dart';
part 'SaveEmailDTO.g.dart';

@freezed
class SaveEmailDTO with _$SaveEmailDTO {
  factory SaveEmailDTO({
    required bool updated,
  }) = _SaveEmailDTO;

  factory SaveEmailDTO.fromJson(Map<String, dynamic> json) =>
      _$SaveEmailDTOFromJson(json);
}
