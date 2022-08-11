import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// Stateful 위젯 사용
class MyBottomNavgationBar extends StatefulWidget {
  const MyBottomNavgationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyBottomNavgationBar();
}

class _MyBottomNavgationBar extends State<MyBottomNavgationBar> {
  // 현재 선택된 탭 인덱스 관리할 변수
  static int _selectedIndex = 0;

  // 탭 될때 인덱스 변수 변경할 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: _selectedIndex == 0 // 선택된 탭은 채워진 아이콘, 나머지는 line 아이콘
                ? SvgPicture.asset('assets/icons/menu-home-solid.svg')
                : SvgPicture.asset('assets/icons/menu-home-line.svg'),
            label: "홈"),
        BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/icons/menu-analysis-solid.svg')
                : SvgPicture.asset('assets/icons/menu-analysis-line.svg'),
            label: "전력분석"),
        BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/icons/menu-simulation-solid.svg')
                : SvgPicture.asset('assets/icons/menu-simulation-line.svg'),
            label: "시뮬레이션"),
        BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/icons/menu-smarthome-solid.svg')
                : SvgPicture.asset('assets/icons/menu-smarthome-line.svg'),
            label: "스마트홈"),
        BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? SvgPicture.asset('assets/icons/menu-mypage-solid.svg')
                : SvgPicture.asset('assets/icons/menu-mypage-line.svg'),
            label: "마이페이지"),
      ],
      // 현재 인덱스를 _selectedIndex에 저장
      currentIndex: _selectedIndex,
      // 요소(item)을 탭 할 시 실행)
      onTap: _onItemTapped,
      // 선택에 따라 icon·label 색상 변경
      selectedItemColor: context.theme.colorScheme.onBackground,
      unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
      // 선택에 따라 label text style 변경
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedLabelStyle: TextStyle(fontSize: 10),
      // 탭 애니메이션 변경 (fixed: 없음)
      type: BottomNavigationBarType.fixed,
    );
  }
}
