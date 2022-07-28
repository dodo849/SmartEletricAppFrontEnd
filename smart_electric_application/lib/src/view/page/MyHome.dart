import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/page/SecondPage.dart';
import 'package:smart_electric_application/src/view/component/CurrentCharge.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatelessWidget {
  // const MyHome({Key? key}) : super(key: key);

  RxBool _isLightTheme = false.obs;

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
          child: Text('Dark/Light'),
          onPressed: () {
            // 다크모드가 토글됩니다.
            Get.isDarkMode ?
            Get.changeTheme(ThemeData.light()) :
            Get.changeTheme(ThemeData.dark());
          },
        ),
        CurrentCharge(),
        Obx(
          () => Text(
            'Click on switch to change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
          ),
        ),
        ObxValue(
          (data) => Switch(
            value: _isLightTheme.value,
            onChanged: (val) {
              _isLightTheme.value = val;
              Get.changeThemeMode(
                  _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                );
                _saveThemeStatus();
              },
            ),
            false.obs,
        ),
      ]),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
