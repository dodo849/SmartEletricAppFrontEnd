import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/component/NowChargeBanner.dart';
import 'package:smart_electric_application/src/view/component/ProgressiveSectionCard.dart';
import 'package:smart_electric_application/src/view/page/SecondPage.dart';
import 'package:smart_electric_application/src/view/component/EstimatedChargeCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatelessWidget {
  // const MyHome({Key? key}) : super(key: key);

  RxBool _isLightTheme = false.obs;

  bool isLightTheme = true;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: EmptyAppBar(),
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          Column(children: [
            NowChargeBanner(),
            EstimatedChargeCard(),
            SizedBox(height: 15),
            ProgressiveSectionCard(),
            SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.theme.colorScheme.secondary),
                ),
                onPressed: () {
                  if (isLightTheme) {
                    Get.changeThemeMode(ThemeMode.dark);
                    isLightTheme = false;
                  } else {
                    Get.changeThemeMode(ThemeMode.light);
                    isLightTheme = true;
                  }
                },
                child:
                    Text("light/dark", style: TextStyle(color: Colors.white))),
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
            Tab(icon: Icon(Icons.directions_transit), text: "transit"),
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
