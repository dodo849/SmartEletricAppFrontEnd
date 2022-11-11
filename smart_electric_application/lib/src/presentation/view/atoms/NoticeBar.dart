import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NoticeBar extends StatelessWidget {
  const NoticeBar({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: colorTheme.surface, borderRadius: BorderRadius.circular(10)),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.8),
          ),
        ),
      ),
    ]);
  }
}
