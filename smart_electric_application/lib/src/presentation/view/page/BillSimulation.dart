import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ImageButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductList.dart';
import 'package:smart_electric_application/src/presentation/view/page/AddBillSimulationProduct.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulation extends StatelessWidget {
  const BillSimulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VeiwModel DI
    Get.put(BillSimulationViewModel());

    return Stack(children: [
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 25),
            BillSimulationBanner(),
            SizedBox(height: 30),
            Row(
              children: [
                Text("시뮬레이션 가전 목록", style: context.theme.textTheme.headline3),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Get.to(AddBillSimulationProduct(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text("추가하기")),
                SizedBox(width: 10),
                Text("편집하기"),
              ],
            ),
            SizedBox(height: 5),
            BillSimulationProductList(),
            SizedBox(height: 200),
          ]),
        ),
      ),
      Container(
        child: Column(children: [
          Spacer(),
          BillSimulationCard(),
        ]),
      )
    ]);
  }
}
