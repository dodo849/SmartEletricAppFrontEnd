import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/RemoveOverScrollBehavior.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/NoticeBar.dart';
import 'package:smart_electric_application/src/presentation/view/module/ai_report/AiReportBarGraph.dart';
import 'package:smart_electric_application/src/presentation/view/module/ai_report/DayTypeCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/ai_report/NightTypeCard.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/presentation/view/module/home/ProgressiveIntervalBar.dart';
import 'package:smart_electric_application/src/presentation/view/page/Home.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AiReportViewModel.dart';

class AiReport extends GetView<AiReportViewModel> {
  const AiReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(AiReportViewModel(context: context));

    var colorTheme = context.theme.colorScheme;

    var bannerTitleTextStyle = TextStyle(
        color: CommonColors.onBlack,
        fontSize: 22,
        fontWeight: FontWeight.bold);
    var bannerBodyTextStyle = TextStyle(
        color: CommonColors.onBlack,
        fontSize: 13,
        fontWeight: FontWeight.w500);

    var contentTitleTextStyle = TextStyle(
        fontFamily: 'Pretendard',
        color: colorTheme.onBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold);
    var contentBodyTextStyle = TextStyle(
        fontFamily: 'Pretendard',
        color: colorTheme.onSurfaceVariant,
        fontSize: 14,
        fontWeight: FontWeight.normal);

    double contentGap = 100;

    return Obx(()=>Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        title: const Text('AI 분석'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: CommonColors.onBlack,
            fontSize: 18,
            fontFamily: "Pretendard"),
        foregroundColor: CommonColors.onBlack,
        shadowColor: Colors.transparent,
        backgroundColor: controller.navigationBarColor.value,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
          physics: ClampingScrollPhysics(),
          child: Obx(
            () => Container(
              width: double.infinity,
              height: 2400,
              child: Column(children: [
                // Banner
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: colorTheme.primary,
                  ),
                  child: Stack(
                    children: [
                      // 이미지
                      Container(
                          width: double.infinity,
                          height: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/avata_woman_paper.png',
                                  width: 125, fit: BoxFit.cover),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          )),
                      // 리포트 소개 문구
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 25, 0, 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("AI가 분석한 리포트로", style: bannerTitleTextStyle),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("내 전기 사용을 한눈에!",
                                  style: bannerTitleTextStyle),
                              const SizedBox(height: 15),
                              Text("매일 새벽 5시", style: bannerBodyTextStyle),
                              const SizedBox(height: 10),
                              Text("새로운 데이터를 ai가 학습하고 있어요",
                                  style: bannerBodyTextStyle),
                              const SizedBox(height: 10),
                              Text("점점 더 정확하게 분석해드릴게요 :)",
                                  style: bannerBodyTextStyle),
                            ]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Ai content
                controller.loading.isTrue
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: NoticeBar(content: "로딩중입니다"),
                      )
                    : Container(
                        width: double.infinity,
                        height: 2400 - 350,
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Content 1 Description
                            RichText(
                              text: TextSpan(
                                text: '어제 ',
                                style: contentTitleTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '${controller.aiReport.value.timePeriodIndex[0] * 4}시~${controller.aiReport.value.timePeriodIndex[0] * 4 + 4}시',
                                    // text: '1시~4시 사이',
                                    style: TextStyle(
                                        color: colorTheme.primaryContainer),
                                  ),
                                  TextSpan(text: "에"),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("전력 사용량이 가장 높았어요",
                                style: contentTitleTextStyle),
                            SizedBox(height: 7),
                            Text(
                                "그 외에 ${controller.aiReport.value.timePeriodIndex[1] * 4}시~${controller.aiReport.value.timePeriodIndex[1] * 4 + 3}시 사이에도 높은 사용량을 보였습니다.",
                                style: contentBodyTextStyle),
                            SizedBox(height: 20),
                            // Content 1 Card
                            Container(
                              width: double.infinity,
                              height: 250,
                              padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorTheme.surface,
                              ),
                              child: AiReportBarGraph(),
                            ),

                            // Content 2
                            SizedBox(height: contentGap),
                            Text("어제까지를 기반으로 예측한", style: contentBodyTextStyle),
                            SizedBox(height: 7),
                            Text("오늘 예측 사용량은", style: contentTitleTextStyle),
                            SizedBox(height: 20),
                            // Content 2 Card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorTheme.surface,
                              ),
                              child: Column(children: [
                                SizedBox(height: 25),
                                Text(
                                    "${controller.aiReport.value.predictionPowerUsage.toStringAsFixed(2)}kWh"),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Text(
                                        "${controller.fomattingWon(controller.aiReport.value.predictionBill)}",
                                        style: TextStyle(
                                            color: colorTheme.secondary,
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 5),
                                    Text("원"),
                                  ],
                                ),
                                SizedBox(height: 25),
                              ]),
                            ),
                            SizedBox(height: 10),
                            Text("*누진구간 및 할인혜택 미적용 금액"),

                            // Content 3
                            SizedBox(height: contentGap),
                            Text("지금까지로 보자면 이번달엔", style: contentBodyTextStyle),
                            SizedBox(height: 7),
                            Text(
                                "${controller.predictionSectionType.value.krString} 누진구간이 적용됩니다.",
                                style: contentTitleTextStyle),
                            SizedBox(height: 20),
                            // Content 3 Card
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorTheme.surface,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 40),
                                  const ProgressiveIntervalBar(
                                      currentRate: 300,
                                      currentSectionNumber: 2),
                                  SizedBox(height: 40),
                                ],
                              ),
                            ),

                            // Content 4
                            SizedBox(height: contentGap),
                            Text("지난 청구일 기준으로", style: contentBodyTextStyle),
                            SizedBox(height: 7),
                            RichText(
                              text: TextSpan(
                                text: '일단위 통계량 ',
                                style: contentTitleTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '을 보여드릴게요',
                                    style: contentBodyTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // Content 4 Card
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colorTheme.surface,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("최대"),
                                              SvgPicture.asset(
                                                  'assets/icons/electric_max.svg'),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                              "${controller.aiReport.value.dayPowerUsageMax.toStringAsFixed(1)}kWh"),
                                          RichText(
                                            text: TextSpan(
                                              text: '￦ ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: colorTheme.error),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '${controller.fomattingWon(controller.aiReport.value.dayPowerUsageMaxInWon)}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: colorTheme.error),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(width: 7),
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colorTheme.surface,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("최소"),
                                              SvgPicture.asset(
                                                  'assets/icons/electric_min.svg'),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                              "${controller.aiReport.value.dayPowerUsageMin.toStringAsFixed(1)}kWh"),
                                          RichText(
                                            text: TextSpan(
                                              text: '￦ ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: colorTheme
                                                      .tertiaryContainer),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '${controller.fomattingWon(controller.aiReport.value.dayPowerUsageMinInWon)}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(width: 7),
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colorTheme.surface,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("평균"),
                                              SvgPicture.asset(
                                                  'assets/icons/electric_avg.svg'),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                              "${controller.aiReport.value.dayPowerUsageMean.toStringAsFixed(1)}kWh"),
                                          RichText(
                                            text: TextSpan(
                                              text: '￦ ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: colorTheme
                                                      .primaryContainer),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '${controller.fomattingWon(controller.aiReport.value.dayPowerUsageMeanInWon)}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),

                            // Content 5
                            SizedBox(height: contentGap),
                            RichText(
                              text: TextSpan(
                                text:
                                    '${AiReportViewModel.to.user.value.name}님의 ',
                                style: contentBodyTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '전기사용 패턴 분석 결과 ',
                                    style: contentTitleTextStyle,
                                  ),
                                  TextSpan(
                                    text: '입니다!',
                                    // style: contentTitleTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // Content 5 Card
                            controller.aiReport.value.dayOrNight == "daytime"
                                ? DayTypeCard()
                                : NightTypeCard(),

                            // Content 6 - 요일별 사용량
                            SizedBox(height: contentGap),
                            AiReportViewModel.to.isWeekdayMore.isTrue
                                ? Text("주말보다 평일 사용량이 많아요!")
                                : Text("평일보다 주말 사용량이 많아요!",
                                    style: contentBodyTextStyle),
                            SizedBox(height: 7),
                            RichText(
                              text: TextSpan(
                                text: '월',
                                style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    color: AiReportViewModel.to.aiReport.value
                                                .weekdayIndex[0] ==
                                            0
                                        ? colorTheme.primaryContainer
                                        : colorTheme.onSurface,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '화',
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                1
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                  TextSpan(
                                    text: "수",
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                2
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                  TextSpan(
                                    text: "목",
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                3
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                  TextSpan(
                                    text: "금",
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                4
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                  TextSpan(
                                    text: "토",
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                5
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                  TextSpan(
                                    text: "일",
                                    style: TextStyle(
                                        color: AiReportViewModel.to.aiReport
                                                    .value.weekdayIndex[0] ==
                                                6
                                            ? colorTheme.primaryContainer
                                            : colorTheme.onSurface),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // Content 6 Card
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AiReportViewModel.to.isWeekdayMore.isTrue
                                      ? 'assets/images/weekday.png'
                                      : 'assets/images/weekend.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ]),
            ),
          )),
      // bottomNavigationBar: MyBottomNavgationBar(),
    ));
  }
}
