import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {required this.title,
      required this.content,
      required this.actionButtons,
      super.key});

  final String title;
  final String content;
  final List<Widget> actionButtons;

  @override
  Widget build(BuildContext context) {

    var textAlign = TextAlign.center;

    double horizonPadding = 30;

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      titlePadding: EdgeInsets.fromLTRB(horizonPadding, 40, horizonPadding, 0),
      contentPadding: EdgeInsets.fromLTRB(horizonPadding, 10, horizonPadding, 15),
      actionsPadding: EdgeInsets.fromLTRB(20, 15, 20, 30),
      title: Text(title, style: _getTitleTextStyle(context), textAlign: textAlign,),
      content: Text(content, style: _getContentTextStyle(context), textAlign: textAlign),
      actions: actionButtons,
    );
  }

  TextStyle _getTitleTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: context.theme.colorScheme.onBackground);
  }

    TextStyle _getContentTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: context.theme.colorScheme.onSurface, height: 1.5);
  }
}
