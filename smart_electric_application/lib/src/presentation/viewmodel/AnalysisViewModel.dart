import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetUserUsecase.dart';

class AnalysisViewModel extends GetxController {
  static AnalysisViewModel get to => Get.find();

  // - Data variables
  RxString userName = "".obs;

  // - Usecase
  var getUserUsecase = GetUserUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    // Fetch and set user name
    UserModel userModel = await fetchUser();
    setUserName(userModel.name);

    super.onInit();
  }

  Future<UserModel> fetchUser() async {
    Result<UserModel, String> userResult = await getUserUsecase.execute();
    return userResult.value!;
  }

  void setUserName(String name) {
    userName(name);
  }
}
