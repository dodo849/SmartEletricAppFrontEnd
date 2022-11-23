import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PredictionLineGraphDescription extends StatelessWidget {
  const PredictionLineGraphDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorTheme.background,
          ),
          child: Row(children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: colorTheme.primary),
            ),
            SizedBox(width: 7),
            Text(
              "이번달 사용량",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: colorTheme.secondaryContainer),
            ),
            SizedBox(width: 7),
            Text(
              "예측 사용량",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[400],),
            ),
            SizedBox(width: 7),
            Text(
              "지난달 사용량",
              style: TextStyle(fontSize: 12),
            ),
          ]),
        ),
      ],
    );
  }
}
