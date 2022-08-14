import 'package:flutter/material.dart';
import 'package:smart_electric_application/src/view/module/SmartHomeBanner.dart';
import 'package:smart_electric_application/src/view/module/SmartHomePreparingCard.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            SmartHomeBanner(),
            SizedBox(height: 15),
            Expanded(child: SmartHomePreparingCard()),
            SizedBox(height: 15),
          ],
        ));
  }
}
