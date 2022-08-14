import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MypageMenuListCell extends StatelessWidget {
  const MypageMenuListCell({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(children: [
            Text(
              "${text}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: context.theme.colorScheme.onBackground),
            ),
            Spacer(),
            SvgPicture.asset("assets/icons/arrow-right.svg",
                color: context.theme.colorScheme.onSurface),
          ]),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}
