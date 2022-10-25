import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/BillSimulationProductList.dart';
import 'package:smart_electric_application/src/presentation/view/page/AddBillSimulationProduct.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulation extends StatelessWidget {
  const BillSimulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VeiwModel DI
    Get.put(BillSimulationViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    // Text style

    return Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    BillSimulationBanner(),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text("시뮬레이션 가전 목록",
                            style: context.theme.textTheme.headline3),
                        const Spacer(),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              BillSimulationViewModel.to.showRemoveWarningDialog(context);
                            },
                            child: Text(
                              "삭제하기",
                              style: textTheme.bodyText2,
                            )),
                      ],
                    ),

                    SizedBox(height: 15),

                    // add simulation product button
                    GestureDetector(
                      onTap: () {
                        Get.to(AddBillSimulationProduct(),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                          //padding of outer Container
                          child: DottedBorder(
                        color: colorTheme.outline, //color of dotted/dash line
                        strokeWidth: 1, //thickness of dash/dots
                        dashPattern: [3, 3],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20.0),
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          //inner container
                          padding: EdgeInsets.all(20),
                          width: double
                              .infinity, //width to 100% match to parent container.
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/plus.svg',
                                  color: colorTheme.onSurface, width: 12),
                              const SizedBox(width: 5),
                              Text(
                                "가전 추가하기",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: colorTheme.onSurface),
                              ),
                            ],
                          ), //background color of inner container
                        ),
                      )),
                    ),

                    // 리스트
                    SizedBox(height: 5),
                    BillSimulationProductList(),
                    SizedBox(height: 200),
                  ]),
            ),
          ),
          Container(
            child: Column(children: [
              Spacer(),
              BillSimulationCard(),
            ]),
          )
        ]);
  }
}
