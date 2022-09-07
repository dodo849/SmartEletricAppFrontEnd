import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBackButtonIcon extends StatelessWidget {
  const MyBackButtonIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.arrow_back,
                color: context.theme.colorScheme.onSurface);
  }
}