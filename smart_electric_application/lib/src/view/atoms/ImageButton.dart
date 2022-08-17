import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagedButton extends StatelessWidget {
  const ImagedButton(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.color,
      required this.action})
      : super(key: key);

  final String imagePath;
  final String text;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            children: [
              Spacer(flex:3),
              Text(
                text,
                style: TextStyle(color: color),
              ),
              Spacer(),
              SvgPicture.asset('assets/icons/arrow_right.svg', color: color),
              Spacer(),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(width:10),
            Image.asset(imagePath, width: 100, height: 100),
          ],
        ),
      ]),
    );
  }
}
