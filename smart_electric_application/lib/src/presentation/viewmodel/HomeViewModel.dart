
import 'package:get/get.dart';


class HomeViewModel extends GetxController {
  // Presentation variables
  RxString powerUsageOfThisMonth = "".obs;
  RxString billOfThisMonth = "".obs;
  RxString powerAccumulateThresholdFirst = "".obs;
  RxString powerAccumulateThresholdSecond = "".obs;
  RxString powerAccumulateThresholdSuper = "".obs;


  // Usecase

  @override
  void onInit() {
    // TODO: implement onInit

    fetchThisMonthData();
    
  }

  void fetchThisMonthData(){

  }
  
}
