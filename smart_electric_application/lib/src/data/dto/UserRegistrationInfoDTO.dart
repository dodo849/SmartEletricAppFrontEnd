import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserRegistrationInfoDTO.freezed.dart';
part 'UserRegistrationInfoDTO.g.dart';

@freezed
class UserRegistrationInfoDTO with _$UserRegistrationInfoDTO {
  factory UserRegistrationInfoDTO(
      {required String firebaseUid,
      required String name,
      required String email,
      required String customerNumber,
      required String firebaseMessageToken,
      required bool isSmartMeter}) = _UserRegistrationInfoDTO;
  factory UserRegistrationInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationInfoDTOFromJson(json);
}
