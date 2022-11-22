import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogActionButton extends StatelessWidget {
  const DialogActionButton(
      {required this.text,
      this.onTap,
      this.bgColor,
      this.textColor,
      super.key});

  final String text;
  final Function()? onTap;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: bgColor ?? context.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(100)),
          child: Text(
            text,
            style: TextStyle(
                color: textColor ?? context.theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
