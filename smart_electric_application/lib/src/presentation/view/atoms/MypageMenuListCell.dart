import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MypageMenuListCell extends StatelessWidget {
  const MypageMenuListCell({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(children: [
            SizedBox(width: 10),
            Text(
              "${text}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: context.theme.colorScheme.onBackground),
            ),
            Spacer(),
            Container(
              color: colorTheme.background,
              child: SvgPicture.asset("assets/icons/arrow_right.svg",
                  color: context.theme.colorScheme.onSurface, width: 8),
            ),
          ]),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}
