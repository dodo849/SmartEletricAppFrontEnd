import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SimulationBanner extends StatelessWidget {
  const SimulationBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "요금 시뮬레이션",
                style: context.theme.textTheme.headline1,
              ),
              SizedBox(height: 7),
              Text(
                "지금 고민하고 있는 제품,",
                style: TextStyle(
                    fontSize: 14,
                    color: context.theme.colorScheme.onSurfaceVariant),
              ),
              SizedBox(height: 3),
              Text(
                "구매하기 전에 요금부터 확인해보세요",
                style: TextStyle(
                    fontSize: 14,
                    color: context.theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            "assets/images/avatars-woman-checklist.png",
            width: 100,
            height: 100,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
