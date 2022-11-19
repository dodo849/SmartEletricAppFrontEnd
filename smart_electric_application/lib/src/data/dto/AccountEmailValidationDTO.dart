import 'package:freezed_annotation/freezed_annotation.dart';

part 'AccountEmailValidationDTO.freezed.dart';
part 'AccountEmailValidationDTO.g.dart';

@freezed
class AccountEmailValidationDTO with _$AccountEmailValidationDTO {
  factory AccountEmailValidationDTO({required bool result}) =
      _AccountEmailValidationDTO;
  factory AccountEmailValidationDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountEmailValidationDTOFromJson(json);
}
