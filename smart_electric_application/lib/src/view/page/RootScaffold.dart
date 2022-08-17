import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/module/common/EmptyAppBar.dart';
import 'package:smart_electric_application/src/view/module/common/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/view/page/Analysis.dart';
import 'package:smart_electric_application/src/view/page/Home.dart';
import 'package:smart_electric_application/src/view/page/Simulation.dart';
import 'package:smart_electric_application/src/view/page/MyPage.dart';
import 'package:smart_electric_application/src/view/page/SmartHome.dart';


class RootScaffold extends StatelessWidget{
  // 선택된 탭 인덱스 저장. 자식 위젯인 MyBottomNavgationBar에서 변경한다.
  int selectedIndex = 0;

  // 탭별 화면
  static List<Widget> tabPages = <Widget>[
    const Home(),
    const Analysis(),
    const BillSimulation(),
    const SmartHome(),
    const Mypage(),
  ];

  @override
  Widget build(BuildContext context) {

    // 페이지 전환을 위한 MyBottomNavgationBarController 인스턴스화 (의존성 주입)
    // Get.put : 수명이 페이지와 같음
    Get.put(MyBottomNavgationBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: EmptyAppBar(),
      // MyBottomNavgationBarController의 변수가 변하면 화면 변경
      body: Obx(() => SafeArea(
          child:
              tabPages[MyBottomNavgationBarController.to.selectedIndex.value])),
      bottomNavigationBar: MyBottomNavgationBar(),
    );
  }
}
