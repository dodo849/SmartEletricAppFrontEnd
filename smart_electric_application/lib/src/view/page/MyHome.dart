import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/view/page/SecondPage.dart';
import 'package:smart_electric_application/src/view/component/SampleCard.dart';
import 'package:smart_electric_application/src/view/color/Colors.dart';
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
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(),
      body: Column(children: [
        SampleCard(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.secondary),
          ),
          onPressed: (){
            if (isLightTheme) {
                Get.changeThemeMode(ThemeMode.dark);
                isLightTheme = false;
            }
            else {
              Get.changeThemeMode(ThemeMode.light);  
              isLightTheme = true;
            }
          }, 
          child: Text(
            "light/dark", 
            style: TextStyle(color: Colors.white)
          )
        ),
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
      bottomNavigationBar: BottomAppBar(),
    );
  }
}