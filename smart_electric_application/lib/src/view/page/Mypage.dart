import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/module/MypageMenuList.dart';

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
          ],
        ));
  }
}
