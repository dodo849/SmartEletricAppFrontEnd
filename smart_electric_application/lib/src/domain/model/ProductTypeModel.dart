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

part 'ProductTypeModel.freezed.dart';
part 'ProductTypeModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class ProductTypeModel with _$ProductTypeModel {
  factory ProductTypeModel({required String krName, required String engName}) =
      _ProductTypeModel;

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeModelFromJson(json);
}
