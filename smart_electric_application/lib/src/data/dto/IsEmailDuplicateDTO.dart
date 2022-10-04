import 'package:freezed_annotation/freezed_annotation.dart';

part 'IsEmailDuplicateDTO.freezed.dart';
part 'IsEmailDuplicateDTO.g.dart';

@freezed
class IsEmailDuplicateDTO with _$IsEmailDuplicateDTO {
  factory IsEmailDuplicateDTO({
    @JsonKey(name: "email-duplicated") required bool isEmailDuplicated,
  }) = _IsEmailDuplicateDTO;

  factory IsEmailDuplicateDTO.fromJson(Map<String, dynamic> json) =>
      _$IsEmailDuplicateDTOFromJson(json);
}
