import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedBoutton extends StatelessWidget {
  const RoundedBoutton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                context.theme.colorScheme.primaryContainer),
            foregroundColor:
                MaterialStateProperty.all(context.theme.colorScheme.onSurface),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ))),
        onPressed: () {},
        child: Text(
          '$text',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
        ));
  }
}
