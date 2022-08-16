import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/module/AnlaysisBanner.dart';
import 'package:smart_electric_application/src/view/module/SavingTipTypeGrid.dart';
import 'package:smart_electric_application/src/view/module/TestChart.dart';
import 'package:smart_electric_application/src/view/module/%08BeforeUsageCard.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("create");
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            AnlaysisBanner(),
            SizedBox(height: 30),
            TestChart(),
            SizedBox(height: 30),
            BeforeUsageCard(),
            SavingTipTypeGrid(),
          ],
        ),
      ),
    );
  }
}
