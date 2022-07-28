import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 데이터
    var dataValue = "data";
    var dataDetailValue = "detail data";

    // 박스 내의 텍스트 위젯
    var title = Text(
            "Sample", 
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.onPrimary,
            ),
          );

    var charge = Text(
        "${dataValue}", 
        style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold,
          color: context.theme.colorScheme.onBackground,
        ),
      );   

    var chargeDetail = Text(
        " / ${dataDetailValue}", 
        style: TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.bold,
          color: context.theme.colorScheme.onSecondary,
        ),
      );
  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.theme.colorScheme.outline, width: 1),
        color: context.theme.colorScheme.surface,
      ),
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



