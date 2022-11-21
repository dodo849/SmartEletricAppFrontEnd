import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ProductTypeGridCell.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class SavingTipProductTypeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductTypeData.productTypes;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.87,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ProductTypeData.productTypes.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ProductTypeGridCell(
            productType: ProductTypeData.productTypes[index]);
      },
    );
  }
}
