import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/MypageMenuListCell.dart';

class MypageMenuListController extends GetxController {
  final mypageMenuList = <String>["개인정보", "알림 설정", "고객번호 관리", "문의하기"];
  final mypageMenuPageName = <String>[
    "PersonalInfo",
    "NotificationSettings",
    "ManageCustomerNumber",
    "ContactUs"
  ];
}

class MypageMenuList extends GetView<MypageMenuListController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MypageMenuListController());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.mypageMenuList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed('${controller.mypageMenuPageName[index]}');
                },
                child:
                    MypageMenuListCell(text: controller.mypageMenuList[index])),
          ],
        );
      },
    );
  }
}
