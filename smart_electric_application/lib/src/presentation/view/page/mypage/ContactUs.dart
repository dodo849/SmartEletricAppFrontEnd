import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/auth/GetUserUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/NoticeBar.dart';

class ContactUsViewModel extends GetxController {}

class ContactUs extends GetView<ContactUsViewModel> {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(ContactUsViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    // Text style
    var titleStyle = TextStyle(fontSize: 16, color: colorTheme.onSurface);
    var contentStyle = TextStyle(
        fontSize: 16,
        color: colorTheme.onBackground,
        fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(
        title: const Text('문의하기'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorTheme.onBackground,
            fontSize: 18,
            fontFamily: "Pretendard"),
        foregroundColor: colorTheme.onBackground,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: colorTheme.background,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 10),
          Text("Team Kapple", style: titleStyle),
          const SizedBox(height: 10),
          Text("do83430208gmail.com", style: contentStyle),
          const SizedBox(height: 20),
          NoticeBar(content: "앱 문의·건의는 위 이메일로 부탁드립니다. \n항상 이용해주셔서 감사합니다.")
        ]),
      ),
    );
  }
}
