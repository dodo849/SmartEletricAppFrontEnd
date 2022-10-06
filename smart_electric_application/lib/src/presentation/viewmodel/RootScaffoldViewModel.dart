import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/CheckLoginUseCase.dart';

class RootScaffoldViewModel extends GetxController {
  static RootScaffoldViewModel get to => Get.find();

  // Input variables
  RxBool isLogin = false.obs; // 로그인 상태이면 true

  // Use case
  var checkLoginUseCase = CheckLoginUseCase();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void checkLogin() async {
    Result<bool, String> checkLoginResult = await checkLoginUseCase.excute();

    if (checkLoginResult.value == true) {
      isLogin(true);
    }
  }
}
