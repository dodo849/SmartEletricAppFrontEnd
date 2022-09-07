import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/module/mypage/MypageMenuList.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("마이페이지", style: context.theme.textTheme.headline1),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(color: context.theme.colorScheme.outline),
            SizedBox(
              height: 5,
            ),
            MypageMunuList(),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/Login");
                    },
                    child: Text(
                      "로그아웃",
                      style:
                          TextStyle(color: context.theme.colorScheme.onSurface),
                    ),
                  ),
                ),

                // 첫화면 이동 임시 버튼
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/FirstAccess");
                    },
                    child: Text(
                      "다운로드 첫화면",
                      style:
                          TextStyle(color: context.theme.colorScheme.onSurface),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ));
  }
}
