import 'package:freezed_annotation/freezed_annotation.dart';

part 'EmailDuplicateDTO.freezed.dart';
part 'EmailDuplicateDTO.g.dart';

@freezed
class EmailDuplicateDTO with _$EmailDuplicateDTO {
  factory EmailDuplicateDTO({
    @JsonKey(name: "email-duplicated") required bool isEmailDuplicated,
  }) = _EmailDuplicateDTO;

  factory EmailDuplicateDTO.fromJson(Map<String, dynamic> json) =>
      _$EmailDuplicateDTOFromJson(json);
}
