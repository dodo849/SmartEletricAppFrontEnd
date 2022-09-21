// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JwtTokenDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JwtTokenDTO _$$_JwtTokenDTOFromJson(Map<String, dynamic> json) =>
    _$_JwtTokenDTO(
      accessToken: json['access-token'] as String,
      refreshToken: json['refresh-token'] as String,
    );

Map<String, dynamic> _$$_JwtTokenDTOToJson(_$_JwtTokenDTO instance) =>
    <String, dynamic>{
      'access-token': instance.accessToken,
      'refresh-token': instance.refreshToken,
    };
