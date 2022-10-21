import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

@freezed

/// 사용자가 추가한 시뮬레이션 가전 정보
class BillSimulationProductModel {
  late String productName; // 제품명
  late String modelName; // 모델명
  late ProductTypeModel productType; // 타입 ex. ac, dry, cleaner ...
  late double monthPowerUsage;

  BillSimulationProductModel(
      {required this.productName,
      required this.modelName,
      required this.productType,
      required this.monthPowerUsage});

  static String encode(List<BillSimulationProductModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>(
                (music) => BillSimulationProductModel.toMap(music))
            .toList(),
      );

  static List<BillSimulationProductModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<BillSimulationProductModel>(
              (item) => BillSimulationProductModel.fromJson(item))
          .toList();

  static Map<String, dynamic> toMap(BillSimulationProductModel music) => {
        'productName': music.productName,
        'modelName': music.modelName,
        'productType': music.productType,
        'monthPowerUsage': music.monthPowerUsage,
      };

  factory BillSimulationProductModel.fromJson(Map<String, dynamic> jsonData) {
    return BillSimulationProductModel(
      productName: jsonData['productName'],
      modelName: jsonData['modelName'],
      productType: jsonData['productType'],
      monthPowerUsage: jsonData['monthPowerUsage'],
    );
  }
}
