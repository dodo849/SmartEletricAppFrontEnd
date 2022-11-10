import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnlaysisBanner extends StatelessWidget {
  const AnlaysisBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "소마님은",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "'절약형'",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.primaryContainer,
                  ),
                ),
                Text(
                  " 입니다",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
      ],
    ));
  }
}
