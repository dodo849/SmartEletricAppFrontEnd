import 'package:freezed_annotation/freezed_annotation.dart';

part 'AccountRegistrationDTO.freezed.dart';
part 'AccountRegistrationDTO.g.dart';

@freezed
class AccountRegistrationDTO with _$AccountRegistrationDTO {
  factory AccountRegistrationDTO(
      {required String firebaseUid,
      required String name,
      required String email,
      required String customerNumber,
      required String firebaseMessageToken,
      required bool isSmartMeter}) = _AccountRegistrationDTO;
  factory AccountRegistrationDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountRegistrationDTOFromJson(json);
}
