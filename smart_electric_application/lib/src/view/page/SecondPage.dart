import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/viewmodel/Count.dart';
import 'package:smart_electric_application/src/viewmodel/CountControllerWithReactive.dart';
import 'package:smart_electric_application/src/viewmodel/ThemeViewModel.dart';

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
                Get.to(SecondPage(), binding: BindingsBuilder(() {
                  Get.create<ThemeViewModel>(() => ThemeViewModel());
                }));
              },
              child: Text(
                'put async',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
