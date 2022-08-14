import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/module/BillSimulationCard.dart';
import 'package:smart_electric_application/src/view/module/SimulationBanner.dart';
import 'package:smart_electric_application/src/view/module/SimulationProductList.dart';

class BillSimulation extends StatelessWidget {
  const BillSimulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 35),
          SimulationBanner(),
          SizedBox(height: 10),
          BillSimulationCard(),
          SizedBox(height: 30),
          Row(
            children: [
              Text("시뮬레이션 가전 목록", style: context.theme.textTheme.headline2),
              Spacer(),
              Text("편집하기"),
            ],
          ),
          SimulationProductList(),
        ]),
      ),
    );
  }
}
