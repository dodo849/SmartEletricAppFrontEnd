import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double yHeight = 200 / 6;
    double xWidth = 20;

    List datas = <double>[
      20,
      30,
      10,
      20,
      23,
      32,
      5,
      23,
      43,
      12,
      32,
      23,
      0,
      4,
      2,
      100,
    ];
    return SizedBox(
      height: 200,
      child: Stack(children: [
        // layer 1 : y axis
        Container(
          child: Column(children: [
            for (int i = 0; i < 6; i++) ...[
              Divider(height: yHeight),
            ],
          ]),
        ),
        // layer 2 : x axis
        Container(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var data in datas) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    // color: context.theme.colorScheme.secondary,
                    ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // margin: EdgeInsets.only(top: data),
                    height: 200 / 60 * data,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ))
      ]),
    );
  }
}
