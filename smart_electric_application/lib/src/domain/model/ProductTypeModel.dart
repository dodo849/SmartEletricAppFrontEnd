// 절약 팁 분류 종류
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
