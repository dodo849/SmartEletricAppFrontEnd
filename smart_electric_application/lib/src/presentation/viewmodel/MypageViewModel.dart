import 'package:get/get.dart';
import 'package:smart_electric_application/src/domain/usecase/LogoutUseCase.dart';

class MypageViewModel extends GetxController {
  static MypageViewModel get to => Get.find();

  // Input variables

  // Use case
  var logoutUseCase = LogoutUseCase();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logout() {
    logoutUseCase.execute();
  }
}
