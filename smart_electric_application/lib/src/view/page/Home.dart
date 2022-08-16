import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/module/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/view/module/NowBillBanner.dart';
import 'package:smart_electric_application/src/view/module/ProgressiveIntervalCard.dart';
import 'package:smart_electric_application/src/view/module/Predict%08BillCard.dart';
import 'package:smart_electric_application/src/view/module/ProgressiveIntervalBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/view/module/TestChart.dart';
import 'package:smart_electric_application/src/viewmodel/ThemeViewModel.dart';
import 'package:smart_electric_application/CustomIcon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static RxBool _isLightTheme = false.obs;

  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }

  // _getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  //   }).obs;
  //   _isLightTheme.value = (await _isLight.value)!;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  // }

  static int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 35),
      Row(
        children: [
          NowBillBanner(),
          Spacer(),
          Obx(
            () => GestureDetector(
              onTap: () {
                ThemeViewModel.to.changeTheme();
                _isLightTheme(true);
              }, // Image tapped
              child: ThemeViewModel.to.isLightTheme.isTrue
                  ? Image.asset("assets/images/day.png", width: 70, height: 70)
                  : Image.asset("assets/images/night.png",
                      width: 70, height: 70),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),

      SizedBox(height: 15),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ProgressiveIntervalBar(
          currentRate: 120,
          currentSectionNumber: 1,
        ),
      ),

      SizedBox(height: 15),
      EstimatedBillCard(),

      SizedBox(height: 25),

      Divider(thickness: 10, color: context.theme.colorScheme.surface),
      SizedBox(height: 25),

      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("이번달 예측 사용량", style: context.theme.textTheme.headline3),
            SizedBox(height: 15),
            TestChart(),
          ],
        ),
      ),

      // Obx(() => ElevatedButton(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all(
      //           context.theme.colorScheme.secondary),
      //     ),
      //     onPressed: () {
      //       ThemeViewModel.to.changeTheme();
      //     },
      //     child:
      //         Text("light/dark", style: TextStyle(color: Colors.white)))),

      // // state
      // GetBuilder<ThemeViewModel>(
      //     global: true,
      //     builder: (contoller) {
      //       return ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStateProperty.all(
      //                 context.theme.colorScheme.secondary),
      //           ),
      //           onPressed: () {
      //             contoller.changeTheme();
      //           },
      //           child: Text("light/dark",
      //               style: TextStyle(color: Colors.white)));
      //     }),

      // Obx(
      //   () => Text(
      //     'Change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
      //     style: TextStyle(color: context.theme.colorScheme.onBackground),
      //   ),
      // ),
      // ObxValue(
      //   (data) => Switch(
      //     value: _isLightTheme.value,
      //     onChanged: (val) {
      //       _isLightTheme.value = val;
      //       Get.changeThemeMode(
      //           _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
      //       );
      //         // _saveThemeStatus();
      //       },
      //     ),
      //     false.obs,
      // ),
    ]);
  }
}
