import 'package:get/get.dart';

class EnterCustomerInfoViewModel extends GetxController {
  static EnterCustomerInfoViewModel get to => Get.find();

  RxInt idx = 0.obs;
  RxBool isTextFieldEmpty = true.obs;
  RxString customerNumber = "".obs;

  @override
  void onInit() {
    super.onInit();

    // input 필드 입력 여부에 따라 다음으로 버튼 disable위해 isTextFieldEmpty 토글
    ever(
        customerNumber,
        (_) => customerNumber.value.isEmpty
            ? isTextFieldEmpty(true)
            : isTextFieldEmpty(false));
  }
}