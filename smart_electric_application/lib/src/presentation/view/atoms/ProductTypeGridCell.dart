import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AddBillSimulationProductViewModel.dart';

class ProductTypeCellViewModel extends GetxController {
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

  // Variables
  RxBool isSelected = false.obs;

  // Function
  void select() {
    isSelected.value ? isSelected(false) : isSelected(true);
    // update();
  }
}

class ProductTypeGridCell extends StatelessWidget {
  const ProductTypeGridCell({
    Key? key,
    required this.productType,
    this.color,
    this.onTap,
  }) : super(key: key);

  final ProductTypeModel productType;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.create<ProductTypeCellViewModel>(() => ProductTypeCellViewModel(),
        permanent: false);

    var colorTheme = context.theme.colorScheme;

    return GetX<ProductTypeCellViewModel>(builder: (viewModel) {
      return GestureDetector(
        onTap: () {
          // 부모한테 받은 탭 이벤트 실행
          onTap!();

          // 셀 선택 상태로 UI 변경
          viewModel.select();

          // 이전 뷰에 표시되도록 이전 뷰모델 설정
          AddBillSimulationProductViewModel.to.selectedProductIndex();

          // 모달 pop
          Navigator.of(context).pop();
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: viewModel.isSelected.value ? color! : colorTheme.outline,
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[600]?.withOpacity(0.05),
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                  ),
                  SvgPicture.asset(
                    "assets/icons/product_${productType.engName}.svg",
                    color: viewModel.isSelected.value
                        ? color
                        : colorTheme.onSurface,
                    width: 50,
                    height: 50,
                  ),
                ]),
                SizedBox(height: 10),
                Text(
                  productType.krName,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.normal,
                      color: viewModel.isSelected.value
                          ? color
                          : colorTheme.onSurfaceVariant,
                      fontSize: 12),
                ),
              ],
            )),
      );
    });
  }
}
