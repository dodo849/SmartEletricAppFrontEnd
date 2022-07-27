import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/controller/Count.dart';
import 'package:smart_electric_application/src/controller/CountControllerWithReactive.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountContoller());
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountContoller>(builder: (contoller) {
              return Text("${contoller.count}", style: TextStyle(fontSize: 50));
            }),
            Obx(() =>
                Text("${Get.find<CountControllerWithReactive>().count.value}")),
            Text('0', style: TextStyle(fontSize: 80)),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
