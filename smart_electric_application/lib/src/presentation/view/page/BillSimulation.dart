import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    // Theme
    var colorTheme = context.theme.colorScheme;

    return Obx(() => Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    BillSimulationBanner(),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text("시뮬레이션 가전 목록",
                            style: context.theme.textTheme.headline3),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.to(AddBillSimulationProduct(),
                                  transition: Transition.rightToLeft);
                            },
                            child: const Text("추가하기")),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            BillSimulationViewModel.to.toggleEditMode();
                          },
                          child: Text("편집하기")),
                      ],
                    ),

                    // 리스트에 아무것도 없으면 띄우는 문구
                    if (BillSimulationViewModel
                            .to.billSimulationProductsIsEmpty.value ==
                        true) ...[
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(color: colorTheme.surface, borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(20),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "아직 추가된 가전이 없습니다. \n추가하기를 눌러 가전 정보를 추가해주세요 :)",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],

                    // 리스트
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
        ]));
  }
}
