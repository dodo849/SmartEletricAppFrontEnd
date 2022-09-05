import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/page/RootScaffold.dart';

// BottomNavigationBar 상태 관리를 위한 GetX controller
class MyBottomNavgationBarController extends GetxController {
  // Get.fine 대신 클래스명 사용 가능
  static MyBottomNavgationBarController get to => Get.find();

  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }
}

class MyBottomNavgationBar extends GetView<MyBottomNavgationBarController> {
  const MyBottomNavgationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          backgroundColor: context.theme.colorScheme.background,
          // 현재 인덱스를 selectedIndex에 저장
          currentIndex: controller.selectedIndex.value,
          // 요소(item)을 탭 할 시 실행)
          onTap: controller.changeIndex,
          // 선택에 따라 icon·label 색상 변경
          selectedItemColor: context.theme.colorScheme.onBackground,
          unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
          // label text style 변경
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedLabelStyle: TextStyle(fontSize: 10),
          // 탭 애니메이션 변경 (fixed: 없음)
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value ==
                        0 // 선택된 탭은 채워진 아이콘, 나머지는 line 아이콘
                    ? SvgPicture.asset(
                        'assets/icons/menu_home_solid.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu_home_line.svg',
                      ),
                label: "홈"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 1
                    ? SvgPicture.asset(
                        'assets/icons/menu_analysis_solid.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu_analysis_line.svg',
                      ),
                label: "전력분석"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 2
                    ? SvgPicture.asset(
                        'assets/icons/menu_simulation_solid.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu_simulation_line.svg',
                      ),
                label: "시뮬레이션"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 3
                    ? SvgPicture.asset(
                        'assets/icons/menu_smarthome_solid.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu_smarthome_line.svg',
                      ),
                label: "스마트홈"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 4
                    ? SvgPicture.asset(
                        'assets/icons/menu_mypage_solid.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/menu_mypage_line.svg',
                      ),
                label: "마이페이지"),
          ],
        ));
  }
}
