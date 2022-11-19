// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserValidationDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserValidationDTO _$$_UserValidationDTOFromJson(Map<String, dynamic> json) =>
    _$_UserValidationDTO(
      joinYn: json['joinYn'] as String,
      infoYn: json['infoYn'] as String,
      expAgreeDate: json['exp_agre_dd'] as String,
      provideAgreeDate: json['prvd_agre_dd'] as String,
    );

Map<String, dynamic> _$$_UserValidationDTOToJson(
        _$_UserValidationDTO instance) =>
    <String, dynamic>{
      'joinYn': instance.joinYn,
      'infoYn': instance.infoYn,
      'exp_agre_dd': instance.expAgreeDate,
      'prvd_agre_dd': instance.provideAgreeDate,
    };
