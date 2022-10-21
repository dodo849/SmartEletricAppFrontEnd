import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ProductTypeGridCell.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class SavingTipProductTypeGridController extends GetxController {
  // 절약 팁 분류 종류 목록
  final savingTipTypes = <ProductTypeModel>[
    ProductTypeModel(krName: "에어컨", engName: "ac"),
    ProductTypeModel(krName: "냉장고", engName: "fridge"),
    ProductTypeModel(krName: "정수기", engName: "waterpurifier"),
    ProductTypeModel(krName: "컴퓨터", engName: "pc"),
    ProductTypeModel(krName: "세탁기", engName: "washingmachine"),
    ProductTypeModel(krName: "전등", engName: "lamp"),
    ProductTypeModel(krName: "공기청정기", engName: "airpurifier"),
    ProductTypeModel(krName: "TV", engName: "tv"),
    ProductTypeModel(krName: "청소기", engName: "cleaner"),
    ProductTypeModel(krName: "드라이기", engName: "dryer"),
    ProductTypeModel(krName: "전자레인지", engName: "microwave"),
    ProductTypeModel(krName: "에어프라이기", engName: "airfryer"),
    ProductTypeModel(krName: "전기밥솥", engName: "ricecooker"),
    ProductTypeModel(krName: "식기세척기", engName: "dishwasher"),
    ProductTypeModel(krName: "온열기", engName: "warmer"),
    ProductTypeModel(krName: "선풍기", engName: "fan"),
    ProductTypeModel(krName: "제습기", engName: "dehumidifier"),
    ProductTypeModel(krName: "건조기", engName: "dry"),
  ].obs;
}

class SavingTipProductTypeGrid extends GetView<SavingTipProductTypeGridController> {
  @override
  Widget build(BuildContext context) {

    Get.put(SavingTipProductTypeGridController());

    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.savingTipTypes.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ProductTypeGridCell(
              productType: controller.savingTipTypes[index]);
        },
      ),
    );
  }
}
