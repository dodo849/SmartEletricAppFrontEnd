import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/ThisMonthModel.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/usecase/CreateThisMonthDataUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAddressUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetUserUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/SaveAddressUsecase.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/enum/ProgressiveSectionType.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get to => Get.find();

  // Main data
  late ThisMonthModel thisMonthData;

  // 이거 이렇게 변수 여러개 만들지 말고 Rx<모델>로 처리하게 바꾸기
  // Presentation variables
  RxString userName = "-".obs;
  RxDouble powerUsageOfThisMonth = 0.0.obs;
  RxString powerUsageOfThisMonthStr = "-".obs;
  RxString billOfThisMonth = "계산중".obs;
  RxInt progressiveSection = 0.obs;
  Rx<ProgressiveSectionType> progressiveSectionType =
      ProgressiveSectionType.undefined.obs;
  RxInt powerAccumulateThresholdFirst = 0.obs;
  RxInt powerAccumulateThresholdSecond = 0.obs;
  RxInt powerAccumulateThresholdSuper = 0.obs;
  RxString predictionPowerUsageOfThisMonthStr = "-".obs;
  RxDouble predictionPowerUsageOfThisMonth = 0.0.obs;
  RxString predictionBillOfThisMonth = "-".obs;
  RxInt predictionProgressiveSection = 0.obs;
  Rx<ProgressiveSectionType> predictionProgressiveSectionType =
      ProgressiveSectionType.undefined.obs;
  Rx<UserModel> user = UserModel(
          name: "",
          customerNumber: "",
          email: "",
          isSmartMeter: false,
          billDate: "")
      .obs;
  RxString address = "".obs;

  // Input
  String addressInput = "";

  // Usecase
  var getThisMonthDataUsecase = CreateThisMonthDataUsecase();
  var getUserUsecase = GetUserUsecase();
  var getAdressUsecase = GetAddressUsecase();
  var saveAddressUsecase = SaveAddressUsecase();

  @override
  void onInit() async {
    // TODO: implement onInit

    await fetchThisMonthData();
    await fetchUser();
    await fetchAddress();

    // Setting view variables
    setUserName(thisMonthData.userName);
    setPowerUsageOfThisMonth(thisMonthData.powerUsage);
    setBillOfThisMonth(thisMonthData.bill);
    setProgressiveSection(thisMonthData.progressiveSection);
    setPowerAccumulateThreshold(
        thisMonthData.accumulateThresholdFirst,
        thisMonthData.accumulateThresholdSecond,
        thisMonthData.accumulateThresholdSuper);
    setPredictedPowerUsageOfThisMonth(thisMonthData.predictionPowerUsage);
    setPredictedBillOfThisMonth(thisMonthData.predictionBill);
    setPredictedProgressiveSection(thisMonthData.predictionProgressiveSection);
  }

  // - Data fetch and save function
  Future<void> fetchThisMonthData() async {
    Result<ThisMonthModel, String> thisMonthDataResult =
        await getThisMonthDataUsecase.execute();

    if (thisMonthDataResult.status == ResultStatus.error) {
      print("${thisMonthDataResult.error}");
      return;
    }

    thisMonthData = thisMonthDataResult.value!;
  }

  Future<void> fetchUser() async {
    Result<UserModel, String> userResult = await getUserUsecase.execute();

    if (userResult.status == ResultStatus.error) {
      return;
    } else {
      user(userResult.value!);
      return;
    }
  }

  Future<void> fetchAddress() async {
    Result<String?, String> addressResult = await getAdressUsecase.execute();

    if (addressResult.value == null || addressResult.value!.length == 0) {
      address("터치해서 주소를 설정해주세요");
    } else {
      address(addressResult.value!);
    }

    return;
  }

  void saveAddress(String address) async {
    // 저장하고
    await saveAddressUsecase.execute(address);

    // 화면 바뀌도록 다시 fetch
    fetchAddress();
  }

  // Function - Setter
  void setUserName(name) {
    userName(name);
  }

  void setPowerUsageOfThisMonth(powerUsage) {
    powerUsageOfThisMonth(powerUsage);
    powerUsageOfThisMonthStr("${powerUsage.toStringAsFixed(2)}");
  }

  void setBillOfThisMonth(bill) {
    var formatter = NumberFormat('###,###,###,###');
    billOfThisMonth(formatter.format(bill));
  }

  void setProgressiveSection(sectionNumber) {
    progressiveSection(sectionNumber);
    progressiveSectionType(ProgressiveSectionType.values[sectionNumber]);
  }

  // 누진구간 임계값 설정
  void setPowerAccumulateThreshold(int first, int second, int third) {
    powerAccumulateThresholdFirst(first);
    powerAccumulateThresholdSecond(second);
    powerAccumulateThresholdSuper(third);
  }

  void setPredictedPowerUsageOfThisMonth(powerUsage) {
    predictionPowerUsageOfThisMonth(powerUsage);
    predictionPowerUsageOfThisMonthStr("${powerUsage.toStringAsFixed(2)}");
  }

  void setPredictedBillOfThisMonth(bill) {
    var formatter = NumberFormat('###,###,###,###');
    predictionBillOfThisMonth(formatter.format(bill));
  }

  void setPredictedProgressiveSection(sectionNumber) {
    predictionProgressiveSection(sectionNumber);
    predictionProgressiveSectionType(
        ProgressiveSectionType.values[sectionNumber]);
  }
}
