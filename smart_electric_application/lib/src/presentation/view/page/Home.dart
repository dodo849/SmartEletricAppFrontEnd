import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/BarGraph.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/NowBillBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/Predict%08BillCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/ProgressiveIntervalBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/TestChart.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';
import 'package:smart_electric_application/CustomIcon.dart';

class Home extends StatelessWidget {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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

  @override
  Widget build(BuildContext context) {
    // Theme define
    var colorTheme = context.theme.colorScheme;

    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 20),

        ElevatedButton(onPressed: () async {
          var firebaseRepository  = FirebaseRepository();
          var user = firebaseRepository.getUser();
          var idToken = await user?.getIdToken();
          print('idToken $idToken');

          var authRepository  = AuthRepository();
          var jwtTokens = await authRepository.getJwtTokens(idToken!);
          print(jwtTokens.value);
        }, child: Text("Test Button")),

        // 스마트 전기앱 로고
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/logo_common.svg',
                color: colorTheme.surfaceVariant,
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "스마트 전기앱",
                style: TextStyle(
                    fontSize: 16,
                    color: colorTheme.surfaceVariant,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        const SizedBox(height: 35),

        // 현재 요금 정보
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              NowBillBanner(),
              Spacer(),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    ThemeViewModel.to.changeTheme();
                  }, // Image tapped
                  child: ThemeViewModel.to.isLightTheme.isTrue
                      ? Image.asset("assets/images/day.png",
                          width: 70, height: 70)
                      : Image.asset("assets/images/night.png",
                          width: 70, height: 70),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),

        // 누진 구간 바
        SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ProgressiveIntervalBar(
            currentRate: 120,
            currentSectionNumber: 1,
          ),
        ),

        const SizedBox(height: 35),

        // 예측 요금
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: colorTheme.surface),
          child: Column(
            children: [
              SizedBox(height: 30),
              EstimatedBillCard(),
              SizedBox(height: 30),
            ],
          ),
        ),

        SizedBox(height: 35),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("이번달 예측 사용량", style: context.theme.textTheme.headline3),
              const SizedBox(height: 15),
              BarGraph(),
              const SizedBox(height: 40),
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
      ]),
    );
  }
}
