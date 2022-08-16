import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/model/SavingTipTypeModel.dart';
import 'package:smart_electric_application/src/view/atoms/SavingTipTypeGridCell.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class SavingTipTypeGridController extends GetxController {
  final savingTipTypes = <SavingTipTypeModel>[
    SavingTipTypeModel(typeName: "에어컨", iconName: "ac"),
    SavingTipTypeModel(typeName: "에어컨", iconName: "ac"),
    SavingTipTypeModel(typeName: "에어컨", iconName: "ac"),
    SavingTipTypeModel(typeName: "에어컨", iconName: "ac"),
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
          childAspectRatio: 0.2,
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
