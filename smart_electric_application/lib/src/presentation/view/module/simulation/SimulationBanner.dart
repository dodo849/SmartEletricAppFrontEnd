import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SimulationBanner extends StatelessWidget {
  const SimulationBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorTheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: RichText(
            text: TextSpan(
              text: '요금 시뮬레이션',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: colorTheme.onBackground),
              children: <TextSpan>[
                TextSpan(
                    text: '을 통해 지금 고민하고 있는 제품의 전기요금을 구매하기 전에 확인해보세요',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTheme.onSurface)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
