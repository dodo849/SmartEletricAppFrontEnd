import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/SavingTipTypeModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/SavingTipTypeGridCell.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class SavingTipTypeGridController extends GetxController {
  // 절약 팁 분류 종류 목록
  final savingTipTypes = <SavingTipTypeModel>[
    SavingTipTypeModel(krName: "에어컨", engName: "ac"),
    SavingTipTypeModel(krName: "냉장고", engName: "fridge"),
    SavingTipTypeModel(krName: "정수기", engName: "waterpurifier"),
    SavingTipTypeModel(krName: "컴퓨터", engName: "pc"),
    SavingTipTypeModel(krName: "세탁기", engName: "washingmachine"),
    SavingTipTypeModel(krName: "전등", engName: "lamp"),
    SavingTipTypeModel(krName: "공기청정기", engName: "airpurifier"),
    SavingTipTypeModel(krName: "TV", engName: "tv"),
    SavingTipTypeModel(krName: "청소기", engName: "cleaner"),
    SavingTipTypeModel(krName: "드라이기", engName: "dryer"),
    SavingTipTypeModel(krName: "전자레인지", engName: "microwave"),
    SavingTipTypeModel(krName: "에어프라이기", engName: "airfryer"),
    SavingTipTypeModel(krName: "전기밥솥", engName: "ricecooker"),
    SavingTipTypeModel(krName: "식기세척기", engName: "dishwasher"),
    SavingTipTypeModel(krName: "온열기", engName: "warmer"),
    SavingTipTypeModel(krName: "선풍기", engName: "fan"),
    SavingTipTypeModel(krName: "제습기", engName: "dehumidifier"),
    SavingTipTypeModel(krName: "건조기", engName: "dry"),
  ].obs;
}

class SavingTipTypeGrid extends GetView<SavingTipTypeGridController> {
  @override
  Widget build(BuildContext context) {

    Get.put(SavingTipTypeGridController());

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
          return SavingTipTypeGridCell(
              savingTipType: controller.savingTipTypes[index]);
        },
      ),
    );
  }
}
