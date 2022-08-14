import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/atoms/MypageMenuListCell.dart';

class MypageMunuListController extends GetxController {
  final mypageMenuList = <String>["개인정보 변경", "알림 설정", "고객번호 관리", "문의하기"].obs;
}

class MypageMunuList extends GetView<MypageMunuListController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MypageMunuListController());

    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.mypageMenuList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MypageMenuListCell(text: controller.mypageMenuList[index]),
            ],
          );
        },
      ),
    );
  }
}
