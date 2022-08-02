import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 데이터
    var dataValue = "53,120원";
    var bodyValue = "325 kWh";
    var bodyDetailValue = "12";

    // 박스 내의 텍스트 위젯
    var title = Text(
            "이번달 예상 요금", 
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
        " / ${bodyValue}", 
        style: TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.bold,
          color: context.theme.colorScheme.onSecondary,
        ),
      );

      var chargeCompare = Text(
        " 지난달 대비 ${bodyDetailValue}% ▼", 
        style: TextStyle(
          fontSize: 12, 
          fontWeight: FontWeight.normal,
          color: context.theme.colorScheme.primaryContainer,
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
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              charge,
              chargeDetail,
            ],
          ),
          SizedBox(height: 7),
          chargeCompare,
          SizedBox(height: 3),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primaryContainer),
              foregroundColor: MaterialStateProperty.all(context.theme.colorScheme.onSurface),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: (){}, 
            child: Text("AI 분석 리포트 보기 > "))
        ],
      )
    );
  }
}



