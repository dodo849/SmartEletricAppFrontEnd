import 'package:get/get.dart';

class EnterCustomerInfoViewModel extends GetxController {
  static EnterCustomerInfoViewModel get to => Get.find();

  RxInt idx = 0.obs; // 실제 페이지 인덱스
  RxInt tempIdx = 0.obs; // fadein&out위한 임시 인덱스
  RxBool isButtonEnable = false.obs;
  RxDouble viewOpacity = 1.0.obs;
  RxString customerNumber = "".obs;

  @override
  void onInit() {
    super.onInit();

    // 페이지 인덱스 변경되되면 fade out      
    ever(tempIdx, (_) => viewOpacity(0.0));

    // 몇초 뒤 다시 fade in
    debounce(viewOpacity, (_) {
      viewOpacity(1.0);
    }, time: const Duration(milliseconds: 400));

    // fade out 뒤 실제 페이지 인덱스 변경
    debounce(tempIdx, (_) {
      idx(tempIdx.value);
    }, time: const Duration(milliseconds: 400));
  }
}
