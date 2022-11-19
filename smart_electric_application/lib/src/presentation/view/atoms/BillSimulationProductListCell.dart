import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationProductCellViewModel.dart';

class BillSimulationProductListCell extends StatelessWidget {
  const BillSimulationProductListCell(
      {Key? key, required this.simulationProduct, required this.index})
      : super(key: key);

  final BillSimulationProductModel simulationProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    var simulationProductCellViewModel =
        Get.create(() => BillSimulationProductCellViewModel(), permanent: true);

    // Theme define
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    return GetX<BillSimulationProductCellViewModel>(builder: (viewModel) {
      // 페이지 전환해도 체크 유지되도록 리로드될때마다 인덱스 체크 여부 확인해서 변수 변경
      viewModel.checkIsSelected(index);
      return GestureDetector(
        onTap: () {
          viewModel.onTapProductCell(index);
        },
        child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: viewModel.isSelected.isTrue
                    ? colorTheme.primary
                    : colorTheme.outline,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/product_${simulationProduct.typeEngName}.svg",
                  color: viewModel.isSelected.isTrue
                      ? colorTheme.primaryContainer
                      : colorTheme.onSurface,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${simulationProduct.productName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: colorTheme.onBackground, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${simulationProduct.modelName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: colorTheme.onSurface, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
