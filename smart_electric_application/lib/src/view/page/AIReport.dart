import 'package:flutter/material.dart';
import 'package:smart_electric_application/src/view/module/common/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/view/page/Home.dart';

class AIReport extends StatelessWidget {
  const AIReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: Text("hi"),
      // bottomNavigationBar: MyBottomNavgationBar(),
    );
  }
}
