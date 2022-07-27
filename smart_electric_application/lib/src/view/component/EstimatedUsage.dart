import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimatedUsage extends StatelessWidget {
  const EstimatedUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = [
          Text(
            "이번달 예상 요금", 
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold
              )
            ),
        ];
    return 
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black12, width: 1)
        ),
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(20),
      child: Column(
        children: title,
      )
    );
  }
}
