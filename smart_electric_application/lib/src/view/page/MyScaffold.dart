import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/component/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/view/page/Analysis.dart';
import 'package:smart_electric_application/src/view/page/Home.dart';
import 'package:smart_electric_application/src/view/page/BillSimulation.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  State<MyScaffold> createState() => MyScaffoldState();
}

class MyScaffoldState extends State<MyScaffold> {
  // 선택된 탭 인덱스 저장. 자식 위젯인 MyBottomNavgationBar에서 변경한다.
  int selectedIndex = 0;

  // 탭별 화면  
  static List<Widget> tabPages = <Widget>[
    Home(),
    Analysis(),
    BillSimulation(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: EmptyAppBar(),
      body: tabPages[selectedIndex],
      bottomNavigationBar: MyBottomNavgationBar(),
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
