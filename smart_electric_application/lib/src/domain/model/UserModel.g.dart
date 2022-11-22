// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      customerNumber: json['customerNumber'] as String,
      isSmartMeter: json['isSmartMeter'] as bool,
      billDate: json['billDate'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'customerNumber': instance.customerNumber,
      'isSmartMeter': instance.isSmartMeter,
      'billDate': instance.billDate,
    };
