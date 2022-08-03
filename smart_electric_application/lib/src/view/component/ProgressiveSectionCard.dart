import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressiveSectionCard extends StatelessWidget {
  const ProgressiveSectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "13,030";
    var bodyValue = "125 kWh";

    // 박스 내의 텍스트 위젯
    var title = Text(
      "누진구간",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: context.theme.colorScheme.onSurface,
      ),
    );

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.colorScheme.surface,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,

            SizedBox(height: 20),

            // 현재 누진구간 picker
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFF3ADD8F), width: 1.5),
                    color: context.theme.colorScheme.surface,
                  ),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                  child: Text(
                    "현재 위치",
                    style: TextStyle(color: Color(0xFF3ADD8F)),
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 15,
                  color: Color(0xFF3ADD8F),
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
                          color: Color(0xFF3ADD8F),
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
        ));
  }
}
