// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountRegistrationDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountRegistrationDTO _$$_AccountRegistrationDTOFromJson(
        Map<String, dynamic> json) =>
    _$_AccountRegistrationDTO(
      firebaseUid: json['firebaseUid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      customerNumber: json['customerNumber'] as String,
      firebaseMessageToken: json['firebaseMessageToken'] as String,
      isSmartMeter: json['isSmartMeter'] as bool,
    );

Map<String, dynamic> _$$_AccountRegistrationDTOToJson(
        _$_AccountRegistrationDTO instance) =>
    <String, dynamic>{
      'firebaseUid': instance.firebaseUid,
      'name': instance.name,
      'email': instance.email,
      'customerNumber': instance.customerNumber,
      'firebaseMessageToken': instance.firebaseMessageToken,
      'isSmartMeter': instance.isSmartMeter,
    };
