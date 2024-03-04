import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/GetUserUsecase.dart';

class NotificationSettingsViewModel extends GetxController {}

class NotificationSettings extends GetView<NotificationSettingsViewModel> {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(NotificationSettingsViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    // Text style
    var titleStyle = TextStyle(fontSize: 16, color: colorTheme.onSurface);
    var contentStyle = TextStyle(fontSize: 16, color: colorTheme.onBackground);

    return Scaffold(
      appBar: AppBar(
        title: const Text('알림 설정'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorTheme.onBackground,
            fontSize: 18,
            fontFamily: "Pretendard"),
        foregroundColor: colorTheme.onBackground,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: colorTheme.background,
        child: Column(children: []),
      ),
    );
  }
}
