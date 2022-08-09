import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/component/NowChargeBanner.dart';
import 'package:smart_electric_application/src/view/component/ProgressiveIntervalCard.dart';
import 'package:smart_electric_application/src/view/component/EstimatedChargeCard.dart';
import 'package:smart_electric_application/src/view/component/ProgressiveIntervalBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/viewmodel/ThemeViewModel.dart';

class MyHome extends StatelessWidget {
  // const MyHome({Key? key}) : super(key: key);

  RxBool isLightTheme = false.obs;

  // bool isLightTheme = true;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
    // Get.put(ThemeViewModel());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: EmptyAppBar(),
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          Column(children: [
            SizedBox(height: 35),
            Row(
              children: [
                NowChargeBanner(),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    ThemeViewModel.to.changeTheme();
                  }, // Image tapped
                  child: ThemeViewModel.to.isLightTheme.isTrue
                      ? Image.asset("assets/images/img_day.png",
                          width: 70, height: 70)
                      : Image.asset("assets/images/img_night.png",
                          width: 70, height: 70),
                ),
                Spacer(),
              ],
            ),

            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: ProgressiveIntervalBar(
                currentRate: 230,
                currentSectionNumber: 2,
              ),
            ),

            SizedBox(height: 15),
            EstimatedChargeCard(),

            SizedBox(height: 15),
            ProgressiveIntervalCard(),

            SizedBox(height: 15),

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
          Container(),
          Container(),
          Container(),
          Container(),
        ]),
        bottomNavigationBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black,
          indicatorWeight: 4,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black38,
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          tabs: <Widget>[
            Tab(
                child: Column(children: <Widget>[
              Icon(Icons.directions_car),
              Text("car")
            ])),
            Tab(icon: SvgPicture.asset("assets/icons/menu-home-line.svg"), text: "transit"),
            Tab(icon: Icon(Icons.directions_bike), text: "bike"),
            Tab(icon: Icon(Icons.directions_bike), text: "bike"),
            Tab(icon: Icon(Icons.directions_bike), text: "bike"),
          ],
        ),
      ),
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
