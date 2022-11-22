import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/HomeViewModel.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomActionButton.dart';

class NowBillBanner extends StatelessWidget {
  const NowBillBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define theme
    var colorTheme = context.theme.colorScheme;

    // 데이터
    var dataValue = "13,030";
    var bodyValue = "/ 125 kWh";

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _openSetAdressModal(context);
              },
              child: Text(
                "${HomeViewModel.to.address.value}",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${HomeViewModel.to.userName.value}님의 현재 요금",
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                // 납부정보
                HomeViewModel.to.user.value.billDate.length == 0
                    ? Container()
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: colorTheme.onSurface,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            color: colorTheme.background),
                        child: Text(
                          "매월 ${HomeViewModel.to.user.value.billDate}일 납부",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: colorTheme.onSurface),
                        ),
                        // HomeViewModel.to.user.value.billDate
                      )
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${HomeViewModel.to.billOfThisMonth.value}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "원 ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  "/ ${HomeViewModel.to.powerUsageOfThisMonthStr.value} kWh",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${HomeViewModel.to.progressiveSectionType.value.krString} 누진 구간",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            HomeViewModel.to.progressiveSectionType.value.color,
                      ),
                    ),
                    Text(
                      " 요금 적용",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            HomeViewModel.to.progressiveSectionType.value.color,
                      ),
                    ),
                  ],
                ),

                // 바그래프 설명
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getCurrentPickerCircleMini(),
                    SizedBox(width: 3),
                    Text("현재위치",
                        style: TextStyle(
                            color: colorTheme.onSurface, fontSize: 12)),
                    SizedBox(width: 6),
                    SvgPicture.asset(
                      'assets/icons/picker_circle_gray.svg',
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: 3),
                    Text("예상위치",
                        style: TextStyle(
                            color: colorTheme.onSurface, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget getCurrentPickerCircleMini() {
    var iconName = "assets/icons/picker_circle";

    if (HomeViewModel.to.progressiveSection.value == 0) {
      iconName += "_green";
    } else if (HomeViewModel.to.progressiveSection.value == 1) {
      iconName += "_yellow";
    } else {
      iconName += "_red";
    }

    iconName += ".svg";

    return SvgPicture.asset(
      iconName,
      width: 12,
      height: 12,
    );
  }

  void _openSetAdressModal(BuildContext context) {
    print("tap");
    showModalBottomSheet<void>(
      context: context,
      // 시트안에 스크롤 요소가 있을 경우 시트를 확장해서 스크롤할 수 있는 옵션인데,
      // false인 상태에서는 시트가 화면 절반까지만 차지할 수 있습니다.
      // 따라서 이 속성을 true로 바꿔 화면 절반을 넘어갈 수 있게 설정해줍니다.
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              // 키보드 올라가면 모달 올라가도록
              EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: context.theme.colorScheme.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('주소를 입력해주세요',
                    style: TextStyle(
                        fontSize: 18,
                        color: context.theme.colorScheme.onBackground,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                CustomTextInput(
                  textInputStyle: TextInputStyle.bordered,
                  placeholder: "서울시 강남구 테헤란로 ...",
                  onChanged: (text) {
                    HomeViewModel.to.addressInput = text;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomActionButton(
                      text: "확인",
                      onTap: () {
                        Navigator.pop(context);
                        HomeViewModel.to.saveAddress(HomeViewModel.to.addressInput);
                      },
                      bgColor: context.theme.colorScheme.outline,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
