import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/ProductTypeGridCell.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AddSimulationProductViewModel.dart';

class SelectProductTypeModalViewModel extends GetxController {
  // 가전 분류 종류 목록
  final productTypes = <ProductTypeModel>[
    ProductTypeModel(krName: "에어컨", engName: "ac"),
    ProductTypeModel(krName: "냉장고", engName: "fridge"),
    ProductTypeModel(krName: "정수기", engName: "waterpurifier"),
    ProductTypeModel(krName: "컴퓨터", engName: "pc"),
    ProductTypeModel(krName: "세탁기", engName: "washingmachine"),
    ProductTypeModel(krName: "전등", engName: "lamp"),
    ProductTypeModel(krName: "공기청정기", engName: "airpurifier"),
    ProductTypeModel(krName: "TV", engName: "tv"),
    ProductTypeModel(krName: "청소기", engName: "cleaner"),
    ProductTypeModel(krName: "드라이기", engName: "dryer"),
    ProductTypeModel(krName: "전자레인지", engName: "microwave"),
    ProductTypeModel(krName: "에어프라이기", engName: "airfryer"),
    ProductTypeModel(krName: "전기밥솥", engName: "ricecooker"),
    ProductTypeModel(krName: "식기세척기", engName: "dishwasher"),
    ProductTypeModel(krName: "온열기", engName: "warmer"),
    ProductTypeModel(krName: "선풍기", engName: "fan"),
    ProductTypeModel(krName: "제습기", engName: "dehumidifier"),
    ProductTypeModel(krName: "건조기", engName: "dry"),
  ].obs;

  // 그리드 순서대로 true이면 선택된 것
  // RxList<bool> selectedProduct = List.filled(18, false).obs;
}

class SelectProductTypeModal extends GetView<SelectProductTypeModalViewModel> {
  const SelectProductTypeModal({super.key});

  @override
  Widget build(BuildContext context) {
    
    // ViewModel DI
    Get.put(SelectProductTypeModalViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;

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
                  child: Obx(
                    () => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.productTypes.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductTypeGridCell(
                            onTap: () {
                              AddSimulationProductViewModel.to.selectedProductIndex(index);
                            },
                            // isSelected: controller.selectedProduct[index],
                            productType: controller.productTypes[index],
                            color: colorTheme.secondaryContainer);
                      },
                    ),
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
