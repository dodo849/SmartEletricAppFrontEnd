import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';

class CurrentCharge extends StatelessWidget {
  const CurrentCharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var chargeValue = "data";
    var usageValue = "detail data";

    // 박스 내의 텍스트
    var title = const Text(
            "Sample", 
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold
              ),
          );

    var charge = Text(
        "${chargeValue}", 
        style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold
          ),
      );   

    var chargeDetail = Text(
        " / ${usageValue}", 
        style: TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.bold
          ),
      );
  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.theme.primaryColor, width: 1),
        // color: modeColors.getModeColor(),
        ),
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              charge,
              chargeDetail,
            ],
          )
        ],
      )
    );
  }
}


