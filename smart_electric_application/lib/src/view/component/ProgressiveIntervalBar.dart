import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressiveIntervalBar extends StatelessWidget {
  const ProgressiveIntervalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              // 피커
              Stack(
                alignment: Alignment.center,
                
                children: [
                  SvgPicture.asset(
                    'assets/icons/picker.svg',
                    // color: context.theme.colorScheme.background,
                  ),
                  Positioned(
                    child: Text(
                      "현재 위치",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: context.theme.colorScheme.tertiaryContainer),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 누진구간 bar
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    height: 10,
                    // width: 100,
                    decoration: BoxDecoration(
                        color: context.theme.colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)))),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Container(
                    height: 10,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFBF1A),
                    )),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Container(
                    height: 10,
                    // width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF5D5D),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
