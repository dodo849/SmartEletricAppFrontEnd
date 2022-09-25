import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ImageButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/SimulationBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/SimulationProductList.dart';

class BillSimulation extends StatelessWidget {
  const BillSimulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: SimulationBanner(),
          ),
          SizedBox(height: 10),
          BillSimulationCard(),
          SizedBox(height: 30),
          Row(
            children: [
              Text("시뮬레이션 가전 목록", style: context.theme.textTheme.headline3),
              Spacer(),
              Text("수정하기"),
              SizedBox(width: 10),
              Text("편집하기"),
            ],
          ),
          SizedBox(height: 5),
          SimulationProductList(),
        ]),
      ),
    );
  }
}
