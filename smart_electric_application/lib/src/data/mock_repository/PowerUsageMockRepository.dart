import 'dart:math';

import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/data/dto/RecentPowerUsageByDayDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

/// 전력 사용량 임의 생성
///
/// 시간 0~10kWh,일 0~30kWh, 월 0~100kWh, 연 0~2000kWh 으로 생성하도록 설정
class PowerUsageMockRepository implements PowerUsageRepositoryInterface {
  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByDay({
    required String customerNumber,
    required String startDate,
    required String endDate,
  }) async {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    if (end.isBefore(start)) {
      return const Result.failure('End date must be after start date');
    }

    List<PowerUsageDTO> powerUsageList = _createPoserUsage(
        start: start,
        end: end,
        interval: const Duration(days: 1),
        powerUsageRange: 30);

    return Result.success(powerUsageList);
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByHour({
    required String customerNumber,
    required String startDate,
    required String endDate,
  }) async {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    if (end.isBefore(start)) {
      return const Result.failure('End date must be after start date');
    }

    List<PowerUsageDTO> powerUsageList = _createPoserUsage(
        start: start,
        end: end,
        interval: const Duration(hours: 1),
        powerUsageRange: 10);

    return Result.success(powerUsageList);
  }

  /// Note: 달 마다 일수가 다른 문제로 직접 Date 객체 조작해 생성
  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByMonth({
    required String customerNumber,
    required String startDate,
    required String endDate,
  }) async {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    List<PowerUsageDTO> powerUsageList = [];
    DateTime currentDate = DateTime(start.year, start.month);
    Random random = Random();

    while (currentDate.isBefore(end)) {
      double randomQuantity = random.nextDouble() * 100;
      String dateTimeKr = currentDate.toString();

      PowerUsageDTO powerUsage = PowerUsageDTO(
        dateTimeKr: dateTimeKr,
        powerUsageQuantity: randomQuantity,
      );

      powerUsageList.add(powerUsage);

      currentDate = (currentDate.month < 12)
          ? DateTime(currentDate.year, currentDate.month + 1)
          : DateTime(currentDate.year + 1, 1);
    }

    return Result.success(powerUsageList);
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getPowerUsageByYear(
      {required String customerNumber,
      required String startDate,
      required String endDate}) async {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    if (end.isBefore(start)) {
      return const Result.failure('End date must be after start date');
    }

    List<PowerUsageDTO> powerUsageList = _createPoserUsage(
        start: start,
        end: end,
        interval: const Duration(days: 365),
        powerUsageRange: 2000);

    return Result.success(powerUsageList);
  }

  @override
  Future<Result<RecentPowerUsageByDayDTO, String>> getRecentPowerUsageByDay(
      {required String customerNumber}) async {
    DateTime now = DateTime.now();

    List<PowerUsageDTO> lastMonthUsage = _createPoserUsage(
        start: DateTime(now.year, now.month - 1, 1),
        end: DateTime(now.year, now.month, 1).subtract(const Duration(days: 1)),
        // 다음 달에서 하루 빼기 (전 달 마지막 날)
        interval: const Duration(days: 1));

    List<PowerUsageDTO> secondMonthUsage = _createPoserUsage(
        start: DateTime(now.year, now.month - 2, 1),
        end: DateTime(now.year, now.month - 1, 1)
            .subtract(const Duration(days: 1)),
        interval: const Duration(days: 1),
        powerUsageRange: 30);

    RecentPowerUsageByDayDTO recentPowerUsage = RecentPowerUsageByDayDTO(
        lastMonth: lastMonthUsage, secondLastMonth: secondMonthUsage);

    return Result.success(recentPowerUsage);
  }

  @override
  Future<Result<List<PowerUsageDTO>, String>> getRecentPowerUsageByHour(
      {required String customerNumber}) async {
    DateTime start = DateTime.now();
    DateTime end = DateTime(start.year, start.month, start.day - 1, start.hour);

    List<PowerUsageDTO> powerUsageList = _createPoserUsage(
        start: start,
        end: end,
        interval: const Duration(hours: 1),
        powerUsageRange: 10);

    return Result.success(powerUsageList);
  }

  @override
  Future<Result<PowerUsageDTO, String>> getRecentPowerUsageByMonth(
      {required String customerNumber}) async {
    DateTime now = DateTime.now();

    Random random = Random();

    double randomQuantity = random.nextDouble() * 200;
    String dateTimeKr = now.toString();

    PowerUsageDTO powerUsage = PowerUsageDTO(
      dateTimeKr: dateTimeKr,
      powerUsageQuantity: randomQuantity,
    );

    return Result.success(powerUsage);
  }

  /// 임의의 전력 사용량 데이터 생성
  ///
  /// - [start]: 시작 날짜
  /// - [end]: 끝 날짜
  /// - [interval]: 생성 날짜 간격
  /// - [powerUsageRange]: 생성할 전력 사용량 범위 (일, 월, 연 별 차이 두기)
  List<PowerUsageDTO> _createPoserUsage(
      {required DateTime start,
      required DateTime end,
      required Duration interval,
      int powerUsageRange = 100}) {
    List<PowerUsageDTO> powerUsageList = [];
    Random random = Random();

    for (DateTime date = start;
        date.isBefore(end) || date.isAtSameMomentAs(end);
        date = date.add(interval)) {
      double randomQuantity = random.nextDouble() * powerUsageRange;

      String dateTimeKr = date.toString();

      PowerUsageDTO powerUsage = PowerUsageDTO(
        dateTimeKr: dateTimeKr,
        powerUsageQuantity: randomQuantity,
      );

      powerUsageList.add(powerUsage);
    }

    return powerUsageList;
  }
}
