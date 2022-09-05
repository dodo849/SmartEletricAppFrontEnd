import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/data/model/SavingTipTypeModel.dart';

class SavingTipTypeGridCell extends StatelessWidget {
  const SavingTipTypeGridCell({Key? key, required this.savingTipType})
      : super(key: key);

  final SavingTipTypeModel savingTipType;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: context.theme.colorScheme.outline,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/product_${savingTipType.engName}.svg",
              color: context.theme.colorScheme.primary,
              width: 50,
              height: 50,
            ),
            Text(savingTipType.krName, style: TextStyle(fontSize: 12),),
          ],
        ));
  }
}
