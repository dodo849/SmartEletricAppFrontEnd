import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/GetAiPredictionForGraphUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetRecentPowerUsageByDayUsecase.dart';

class PredictLineGraphViewModel extends GetxController {
  // - Graph setting
  RxDouble minX = 1.0.obs;
  RxDouble maxX = 30.0.obs;

  RxDouble minY = 0.0.obs;
  RxDouble maxY = 150.0.obs;

  // - Data variables
  Map<int, GraphPointModel> lastMonthUsage = {0: GraphPointModel('0', 0)};
  Map<int, GraphPointModel> thisMonthUsage = {0: GraphPointModel('0', 0)};
  Map<int, GraphPointModel> predictedUsage = {};

  // - Presentation variables
  RxBool loading = true.obs;

  // - Usecase
  var getAiPredictionForGraphUsecase = GetAiPredictionForGraphUsecase();
  var getRecentPowerUsageByDayUsecase = GetRecentPowerUsageByDayUsecase();

  @override
  void onInit() async {
    // 지난달 사용량 및 이번달 사용량 가져오기
    RecentPowerUsageByDayDTO? recentPowerUsage =
        await fetchRecentPowerUsageByDay();
    // 성공시 변수 변경
    setLastMonthUsage(recentPowerUsage!.secondLastMonth);
    setThisMonthUsage(recentPowerUsage!.lastMonth);
    // 예측 사용량 가져오기
    List<GraphPointModel>? predictedPoints =
        await fetchPredictedPowerUsageOfThisMonth();
    setPredictedUsage(
        thisMonthUsage.entries.map((e) => e.value).toList(), predictedPoints!);

    maxX(lastMonthUsage.length.toDouble());
    // maxX(31);

    loading(false);
    super.onInit();
  }

  // - Fetch function
  /// 지난달 데이터 및 이번달 오늘까지 데이터 불러오기
  Future<RecentPowerUsageByDayDTO?> fetchRecentPowerUsageByDay() async {
    // 네트워킹
    Result<RecentPowerUsageByDayDTO, String> getRecentPowerUsageByDayResult =
        await getRecentPowerUsageByDayUsecase.execute();

    if (getRecentPowerUsageByDayResult.status == ResultStatus.error) {
      return null;
    } else {
      return getRecentPowerUsageByDayResult.value!;
    }
  }

  /// 예측 사용량 데이터 가져오기
  Future<List<GraphPointModel>?> fetchPredictedPowerUsageOfThisMonth() async {
    // 네트워킹
    Result<List<GraphPointModel>, String> getAiPredictionForGraphResult =
        await getAiPredictionForGraphUsecase.execute();

    if (getAiPredictionForGraphResult.status == ResultStatus.error) {
      return null;
    } else {
      return getAiPredictionForGraphResult.value!;
    }
  }

  // - Variable setter
  void setLastMonthUsage(List<PowerUsageDTO> lastMonthPowerUsage) {
    // 지난달 데이터 누적 값 계산
    List<GraphPointModel> lastMonthGraphPoints = lastMonthPowerUsage
        .map((element) =>
            GraphPointModel(element.dateTimeKr, element.powerUsageQuantity))
        .toList();
    // 누적값으로 변환
    lastMonthGraphPoints = cumulativeCalculation(lastMonthGraphPoints);
    // map으로 변환해서 클래스변수에 대입
    lastMonthUsage = lastMonthGraphPoints.asMap();
  }

  void setThisMonthUsage(List<PowerUsageDTO> thisMonthPowerUsage) {
    // 지난달 데이터 누적 값 계산
    List<GraphPointModel> thisMonthGraphPoints = thisMonthPowerUsage
        .map((element) =>
            GraphPointModel(element.dateTimeKr, element.powerUsageQuantity))
        .toList();
    // 누적값으로 변환
    thisMonthGraphPoints = cumulativeCalculation(thisMonthGraphPoints);
    // map으로 변환해서 클래스변수에 대입
    thisMonthUsage = thisMonthGraphPoints.asMap();
  }

  void setPredictedUsage(List<GraphPointModel> thisMonthUsage,
      List<GraphPointModel> predictedGraphPoints) {
    // 오늘 이전까지 값 자르기
    predictedGraphPoints = predictedGraphPoints.sublist(thisMonthUsage.length);
    // 누적값으로 변환
    predictedGraphPoints = cumulativeCalculation(predictedGraphPoints);
    // 이번달 실 사용량에서 마지막 값 구하기 (오늘 값)
    double lastUsage = thisMonthUsage[thisMonthUsage.length - 1].yValue;
    // 그래프 연결되도록 오늘 값 지정
    predictedUsage[thisMonthUsage.length - 1] =
        GraphPointModel(predictedGraphPoints[0].xValue, lastUsage);
    // 마지막 값 더해서 map으로 변환
    for (var i = 0; i < predictedGraphPoints.length; i++) {
      double thisAccumulateUsage = predictedGraphPoints[i].yValue + lastUsage;
      predictedUsage[i + thisMonthUsage.length] =
          GraphPointModel(predictedGraphPoints[i].xValue, thisAccumulateUsage);
    }
  }

  // - Formatting function
  String formattingDate(String targetDate) {
    DateTime targetDateString = DateTime.parse(targetDate);
    DateFormat formatter = DateFormat('d');
    return formatter.format(targetDateString);
  }

  List<GraphPointModel> cumulativeCalculation(List<GraphPointModel> points) {
    double accumulate = 0.0;

    for (var i = 0; i < points.length; i++) {
      accumulate += points[i].yValue;
      points[i].yValue = accumulate;
    }

    return points;
  }

  // - Graph setting
  double findMaxY(
      {required Map<int, GraphPointModel> lastMonthUsage,
      required Map<int, GraphPointModel> thisMonthUsage,
      required Map<int, GraphPointModel> predictedMonthUsage}) {
    return 0.0;
  }
}
