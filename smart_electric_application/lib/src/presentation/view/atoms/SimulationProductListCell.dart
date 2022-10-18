import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/entity/SimulationProductModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/SimulationProductCellViewModel.dart';

class SimulationProductListCell extends StatelessWidget {
  const SimulationProductListCell(
      {Key? key,
      required SimulationProductModel this.simulationProduct,
      required this.index})
      : super(key: key);

  final SimulationProductModel simulationProduct;
  final int index;

  // final String productName = "";
  // final String productSerialNumber = "";
  // final String productType = "";

  @override
  Widget build(BuildContext context) {
    
    // ViewModel DI
    var simulationProductCellViewModel =
        Get.put(SimulationProductCellViewModel());

    // Theme define
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    return GetBuilder<SimulationProductCellViewModel>(
        id: index.toString(),
        builder: (viewModel) {
          return GestureDetector(
            onTap: () => viewModel.toggleisSelected(index.toString()),
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: viewModel.isSelected.isTrue
                        ? colorTheme.secondaryContainer
                        : colorTheme.outline,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/product_${simulationProduct.type}.svg",
                      color: context.theme.colorScheme.secondaryContainer,
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
                          style: TextStyle(
                              color: colorTheme.onBackground, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${simulationProduct.serialNumber}",
                          style: TextStyle(
                              color: colorTheme.onSurface, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
