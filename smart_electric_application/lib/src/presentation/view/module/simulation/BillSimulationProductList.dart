import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/SimulationProductListCell.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulationProductList extends StatelessWidget {
  const BillSimulationProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(BillSimulationProductListViewModel());

    // ViewModel DI

    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:
              BillSimulationViewModel.to.billSimulationProducts.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(height: 15),
                SimulationProductListCell(
                    // simulationProduct: controller.billSimulationProducts[index],
                    simulationProduct: BillSimulationViewModel
                        .to.billSimulationProducts.value[index],
                    index: index),
              ],
            );
          },
        ));
  }
}
