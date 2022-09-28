import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/SimulationProductModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/SimulationProductListCell.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/SimulationProductCellViewModel.dart';

// 클래스 변수 수정 로직
// historyList.value.addAll(
//   _payload.dataList.map((data) => History.fromJson(data)).toList());
// ac.historyList.refresh();

class SimulationProductListController extends GetxController {
  final simulationProducts = <SimulationProductModel>[
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
    SimulationProductModel(
        name: "20년형 삼성 에어컨", serialNumber: "RR39T6928ADLJDX", type: "ac"),
  ].obs;
}

class SimulationProductList extends GetView<SimulationProductListController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SimulationProductListController());

    // ViewModel DI
    var simulationProductCellViewModel =
        Get.put(SimulationProductCellViewModel());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.simulationProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(height: 15),
            SimulationProductListCell(
                simulationProduct: controller.simulationProducts[index],
                index: index),
          ],
        );
      },
    );
  }
}
