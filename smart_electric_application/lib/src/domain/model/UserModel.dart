// 절약 팁 분류 종류
// import 'dart:convert';

// class ProductTypeModel {
//   late String krName; // 분류 한글명 ex. 에어컨, 청소기
//   late String engName; // 아이콘(영어명) ex. ac, cleaner

//   ProductTypeModel({required String krName, required String engName}) {
//     this.krName = krName;
//     this.engName = engName;
//   }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required String name,
      required String email,
      required String customerNumber,
      required bool isSmartMeter}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
