import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/ai_prediction/GetAiPredictionForGraphUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetRecentPowerUsageByDayUsecase.dart';

class PredictLineGraphViewModel extends GetxController {
  // - Graph setting
  RxDouble minX = 0.0.obs;
  RxDouble maxX = 32.0.obs;

  RxDouble minY = 0.0.obs;
  RxDouble maxY = 100.0.obs;

  // - Data variables
  Map<int, GraphPointModel> lastMonthUsage = {};
  Map<int, GraphPointModel> thisMonthUsage = {};
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

    maxY(
        findMaxY(lastMonthUsage: lastMonthUsage, predictedUsage: predictedUsage)
                .toInt() +
            20);

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
    lastMonthUsage = Map.fromIterables(
        lastMonthGraphPoints.asMap().keys.map((e) => e + 1),
        lastMonthGraphPoints.asMap().values);
  }

  void setThisMonthUsage(List<PowerUsageDTO> thisMonthPowerUsage) {
    // 지난달 데이터 누적 값 계산
    List<GraphPointModel> thisMonthGraphPoints = thisMonthPowerUsage
        .map((element) =>
            GraphPointModel(element.dateTimeKr, element.powerUsageQuantity))
        .toList();
    // 누적값으로 변환
    thisMonthGraphPoints = cumulativeCalculation(thisMonthGraphPoints);
    // map으로 변환해서 클래스변수에 대입, 1부터 시작하도록 key 1부터 시작
    thisMonthUsage = Map.fromIterables(
        thisMonthGraphPoints.asMap().keys.map((e) => e + 1),
        thisMonthGraphPoints.asMap().values);
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
    predictedUsage[thisMonthUsage.length] =
        GraphPointModel(predictedGraphPoints[0].xValue, lastUsage);
    // 마지막 값 더해서 map으로 변환 (map이 1부터 시작하므로 키값에 +1)
    for (var i = 0; i < predictedGraphPoints.length; i++) {
      double thisAccumulateUsage = predictedGraphPoints[i].yValue + lastUsage;
      predictedUsage[i + thisMonthUsage.length + 1] =
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

  // void 

  // - Graph setting
  double findMaxY(
      {required Map<int, GraphPointModel> lastMonthUsage,
      required Map<int, GraphPointModel> predictedUsage}) {
    // 지난달 최대값 찾기
    double lastMonthUsageMax = 0.0;
    lastMonthUsage.forEach((k, v) {
      if (v.yValue > lastMonthUsageMax) {
        lastMonthUsageMax = v.yValue;
      }
    });

    // 예측값 최댓값 찾기
    double predictedUsageMax = 0.0;
    predictedUsage.forEach((k, v) {
      if (v.yValue > predictedUsageMax) {
        predictedUsageMax = v.yValue;
      }
    });

    // 비교해서 큰거 return
    return lastMonthUsageMax > predictedUsageMax
        ? lastMonthUsageMax
        : predictedUsageMax;
  }
}
