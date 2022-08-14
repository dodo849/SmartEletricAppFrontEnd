import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SmartHomePreparingCard extends StatelessWidget {
  const SmartHomePreparingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: context.theme.colorScheme.outline,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("스마트홈 기능은 아직 준비중입니다"),
            SizedBox(height: 5),
            Text("조금만 기다려주세요 :)"),
            Image.asset("assets/images/avatars-woman.jpg",
                      width: 200, height: 200)
          ],
        ));
  }
}
