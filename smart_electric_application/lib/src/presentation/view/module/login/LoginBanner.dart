import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("우리집 전기 관리 솔루션",
            style: TextStyle(color: context.theme.colorScheme.onSurface)),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/logo_yellow.svg"),
                    SizedBox(width: 10),
            Text("스마트전기앱",
                style: TextStyle(
                  color: context.theme.colorScheme.onBackground,
                  fontSize: 28,
                  fontFamily: "Cafe24Surround",
                  textBaseline: TextBaseline.alphabetic
                ))
          ],
        ),
      ],
    ));
  }
}
