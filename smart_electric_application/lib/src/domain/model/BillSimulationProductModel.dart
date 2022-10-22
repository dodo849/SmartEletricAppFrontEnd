import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

part 'BillSimulationProductModel.freezed.dart';
part 'BillSimulationProductModel.g.dart';

/// 사용자가 추가한 시뮬레이션 가전 정보
@freezed
class BillSimulationProductModel with _$BillSimulationProductModel {
  factory BillSimulationProductModel({required String productName, required String modelName, required ProductTypeModel productType,required double monthPowerUsage}) =
      _BillSimulationProductModel;

  factory BillSimulationProductModel.fromJson(Map<String, dynamic> json) =>
      _$BillSimulationProductModelFromJson(json);
}

// class BillSimulationProductModel {
//   late String productName; // 제품명
//   late String modelName; // 모델명
//   late ProductTypeModel productType; // 타입 ex. ac, dry, cleaner ...
//   late double monthPowerUsage;

//   BillSimulationProductModel(
//       {required this.productName,
//       required this.modelName,
//       required this.productType,
//       required this.monthPowerUsage});

//   static String encode(List<BillSimulationProductModel> musics) => json.encode(
//         musics
//             .map<Map<String, dynamic>>(
//                 (music) => BillSimulationProductModel.toMap(music))
//             .toList(),
//       );

//   static List<BillSimulationProductModel> decode(String billSimulationProducts) =>
//       (json.decode(billSimulationProducts) as List<dynamic>)
//           .map<BillSimulationProductModel>(
//               (item) => BillSimulationProductModel.fromJson(item))
//           .toList();

//   static Map<String, dynamic> toMap(BillSimulationProductModel billSimulationProducts) => {
//         'productName': billSimulationProducts.productName,
//         'modelName': billSimulationProducts.modelName,
//         'productType': billSimulationProducts.productType,
//         'monthPowerUsage': billSimulationProducts.monthPowerUsage,
//       };

//   factory BillSimulationProductModel.fromJson(Map<String, dynamic> jsonData) {
//     return BillSimulationProductModel(
//       productName: jsonData['productName'],
//       modelName: jsonData['modelName'],
//       productType: jsonData['productType'],
//       monthPowerUsage: jsonData['monthPowerUsage'],
//     );
//   }
// }
