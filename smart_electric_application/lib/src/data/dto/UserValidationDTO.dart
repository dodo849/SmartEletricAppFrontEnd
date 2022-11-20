import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserValidationDTO.freezed.dart';
part 'UserValidationDTO.g.dart';

/// - [joinYn] : 회원가입 여부
/// - [infoYn] : 정보제공동의 여부
/// - [expAgreeDate] : 정보제공동의 만료일
/// - [provideAgreeDate] : 정보제공 동의일
@freezed
class UserValidationDTO with _$UserValidationDTO {
  factory UserValidationDTO({
    required String joinYn,
    required String infoYn,
    @JsonKey(name: "exp_agre_dd")
    required String expAgreeDate,
    @JsonKey(name: "prvd_agre_dd")
    required String provideAgreeDate,
  }) = _UserValidationDTO;

  factory UserValidationDTO.fromJson(Map<String, dynamic> json) =>
      _$UserValidationDTOFromJson(json);
}