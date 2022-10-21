import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/SimulationProductListCell.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/SimulationProductCellViewModel.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class BillSimulationProductListViewModel extends GetxController {
  final billSimulationProducts = <BillSimulationProductModel>[
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
    BillSimulationProductModel(
        productName: "20년형 삼성 에어컨",
        modelName: "RR39T6928ADLJDX",
        productType: ProductTypeData.productTypes[0],
        monthPowerUsage: 100),
  ].obs;
}

class SimulationProductList extends GetView<BillSimulationProductListViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(BillSimulationProductListViewModel());

    // ViewModel DI
    var simulationProductCellViewModel =
        Get.put(SimulationProductCellViewModel());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.billSimulationProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(height: 15),
            SimulationProductListCell(
                simulationProduct: controller.billSimulationProducts[index],
                index: index),
          ],
        );
      },
    );
  }
}
