import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ProductTypeGridCell.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AddBillSimulationProductViewModel.dart';

class SelectProductTypeModal extends StatelessWidget {
  const SelectProductTypeModal({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme
    var colorTheme = context.theme.colorScheme;

    // List elements
    List<ProductTypeModel> productTypes = ProductTypeData.productTypes;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        color: colorTheme.onSurfaceVariant,
                        // width: 1,5
                        // height: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productTypes.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTypeGridCell(
                        // 선택 시 상위 페이지 뷰모델 변경
                        onTap: () {
                          AddBillSimulationProductViewModel.to
                              .selectedProductIndex(index);

                          // 이전 뷰에 표시되도록 이전 뷰모델 설정
                          AddBillSimulationProductViewModel.to
                              .selectedProductIndex();

                          // 모달 pop
                          Navigator.of(context).pop();
                        },
                        // isSelected: controller.selectedProduct[index],
                        productType: productTypes[index],
                        color: colorTheme.primary,
                        textColor: colorTheme.primaryContainer,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
