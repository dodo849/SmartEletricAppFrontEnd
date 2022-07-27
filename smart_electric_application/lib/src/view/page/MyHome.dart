import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/View/page/SecondPage.dart';
import 'package:smart_electric_application/src/View/component/EstimatedUsage.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            child: Text('click'),
            onPressed: () {
              Get.to(SecondPage());
            }),
        EstimatedUsage()
      ]),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
