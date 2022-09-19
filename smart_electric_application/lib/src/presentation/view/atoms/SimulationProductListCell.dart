import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/SimulationProductModel.dart';

class SimulationProductListCell extends StatelessWidget {
  const SimulationProductListCell(
      {Key? key, required SimulationProductModel this.simulationProduct})
      : super(key: key);

  final SimulationProductModel simulationProduct;

  // final String productName = "";
  // final String productSerialNumber = "";
  // final String productType = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: context.theme.colorScheme.outline,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/product_${simulationProduct.type}.svg",
              color: context.theme.colorScheme.secondary,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${simulationProduct.name}",
                  overflow: TextOverflow.ellipsis,
                ),
                Text("${simulationProduct.serialNumber}"),
              ],
            )
          ],
        ));
  }
}
