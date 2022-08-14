import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class YesterdayUsageCard extends StatelessWidget {
  const YesterdayUsageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "어제 사용량",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/arrow.svg',
                      width: 14,
                      height: 14,
                      color: context.theme.colorScheme.surfaceVariant,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 7),
          
          ],
        ));
  }
}