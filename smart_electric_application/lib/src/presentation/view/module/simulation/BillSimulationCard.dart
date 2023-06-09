import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulationCard extends StatelessWidget {
  const BillSimulationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "13,030";
    var bodyValue = "125 kWh";

    var colorTheme = context.theme.colorScheme;

    return Obx(() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: colorTheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //title
              Row(
                children: [
                  Text(
                    "선택한 제품 구매 시 한달 예상 요금",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colorTheme.onSurface,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        BillSimulationViewModel.to.toggleIsCardOpen();
                      },
                      child: BillSimulationViewModel.to.isCardOpen.value
                          ? SvgPicture.asset('assets/icons/arrow_down.svg')
                          : SvgPicture.asset('assets/icons/arrow_up.svg')),
                ],
              ),

              SizedBox(height: 5),

              // 총 예상 요금
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${BillSimulationViewModel.to.totalBill.value}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: colorTheme.onBackground),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' 원',
                          style: TextStyle(
                            color: colorTheme.onSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 선택된 가전 개수 표시
                  SizedBox(width: 10),
                  Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: colorTheme.outline),
                        child: Text(
                          "${BillSimulationViewModel.to.selectedProductsIndex.length}개 선택",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: colorTheme.onSurface),
                        ),
                        // HomeViewModel.to.user.value.billDate
                      )
                ],
              ),

              SizedBox(height: 5),
              // 누진구간표시
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        color: BillSimulationViewModel
                            .to.progressiveSection.value.color),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${BillSimulationViewModel.to.progressiveSection.value.krString} 누진구간 적용",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colorTheme.onSurface,
                    ),
                  ),
                ],
              ),

              if (BillSimulationViewModel.to.isCardOpen.isTrue) ...[
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 10),

                // 월별 증가된 요금 계산
                Row(
                  children: [
                    Text(
                      "현재 월 예상 요금",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: colorTheme.onSurface,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${BillSimulationViewModel.to.billOfThisMonth}원",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: colorTheme.onBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "월별 예상 추가 요금",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: colorTheme.onSurface,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${BillSimulationViewModel.to.additionalBill.value}원",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: colorTheme.onBackground,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
              ],
            ])));
  }
}
