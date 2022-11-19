import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetUserUsecase.dart';
import 'package:smart_electric_application/src/presentation/view/module/mypage/privacyTermsConditions.dart';

class PersonalInfoViewModel extends GetxController {
  // - Data variables
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString customerNumber = "".obs;
  RxBool isSmartMeter = true.obs;

  // - Usecase
  var getUserUsecase = GetUserUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // Fetch and set user info
    UserModel userModel = await fetchUser();
    userName(userModel.name);
    userEmail(userModel.email);
    customerNumber(userModel.customerNumber);

    super.onInit();
  }

  Future<UserModel> fetchUser() async {
    Result<UserModel, String> userResult = await getUserUsecase.execute();
    return userResult.value!;
  }
}

class PersonalInfo extends GetView<PersonalInfoViewModel> {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(PersonalInfoViewModel());

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
        title: const Text('개인정보'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorTheme.onBackground,
            fontSize: 18,
            fontFamily: "Pretendard"),
        foregroundColor: colorTheme.onBackground,
        shadowColor: Colors.transparent,
      ),
      body: Obx(() => SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(children: [
                // User name
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "이름",
                      style: titleStyle,
                    ),
                    Spacer(),
                    Text("${controller.userName.value}", style: contentStyle)
                  ],
                ),
                // User email
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "이메일",
                      style: titleStyle,
                    ),
                    Spacer(),
                    Text("${controller.userEmail.value}", style: contentStyle)
                  ],
                ),
                // User customer number
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "고객번호",
                      style: titleStyle,
                    ),
                    Spacer(),
                    Text("${controller.customerNumber.value}",
                        style: contentStyle)
                  ],
                ),
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "계량기 종류",
                      style: titleStyle,
                    ),
                    Spacer(),
                    Text(controller.isSmartMeter.isTrue ? "스마트 계량기" : "일반 계량기",
                        style: contentStyle)
                  ],
                ),
                SizedBox(height: 15),
                Divider(),

                // 개인정보 수집 및 이용 약관
                SizedBox(
                  height: 20,
                ),
                PrivacyTermsConditions(),
              ]),
            ),
          )),
    );
  }
}
