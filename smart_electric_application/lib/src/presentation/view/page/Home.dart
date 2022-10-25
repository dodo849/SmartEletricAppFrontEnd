import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/presentation/view/module/graph/PredictLineGraph.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/NowBillBanner.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/Predict%08BillCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/ProgressiveIntervalBar.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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

        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("billSimulationProducts");

              var result =
                  await BillSimulationRepository().getBillSimulationProduct();
              print("getBillSimulationProduct ${result.value}");

              // var firebaseRepository = FirebaseRepository();
              // var user = firebaseRepository.getUser();
              // var idToken = await user?.getIdToken();
              // print('user $user');

              // // var authRepository = AuthRepository();
              // // var jwtTokens = await authRepository.requestJwt(idToken!);
              // // print(jwtTokens.value);

              // var powerUsageRepository = PowerUsageRepository();
              // var powerUsageRepositoryData =
              //     await powerUsageRepository.getPowerUsageByDay(
              //         customerNumber: "0130392270",
              //         startDate: "20220801",
              //         endDate: "20220831");
              // print(powerUsageRepositoryData.status);
              // print(powerUsageRepositoryData.error);
              // print(powerUsageRepositoryData.value);

              // var aiRepository = AiRepository();
              // var predictionResult = await aiRepository.requestAiPrediction(
              //     customerNumber: "0130392270");
              // print("predictionResult: ${predictionResult.value}");
              // var reportResult = await aiRepository.requestAiReport(
              //     customerNumber: "0130392270");
              // print("reportResult: ${reportResult.value}");

              // print("###### 파이어베이스 토큰");
              // final fcmToken = await FirebaseMessaging.instance.getToken();
              // print(fcmToken);
            },
            child: Text("Test Button")),

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
          // padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: colorTheme.surface),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),

              // 요금 분석 카드
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text("요금 분석", style: context.theme.textTheme.headline3),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: EstimatedBillCard(),
              ),

              SizedBox(height: 80),

              // 그래프
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text("이번달 예측 사용량",
                    style: context.theme.textTheme.headline3),
              ),
              SizedBox(height: 45),
              Container(height: 300, child: PredictLineGraph()),

              SizedBox(height: 80),
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
