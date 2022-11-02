import 'package:flutter/material.dart';
import 'package:smart_electric_application/src/presentation/view/theme/Colors.dart';

enum ProgressiveSectionType {
  first('첫번째', CommonColors.green),
  second('두번째', CommonColors.yellow),
  third('세번째', CommonColors.red),
  undefined('-', Colors.transparent);

  final String krString;
  final Color color;
  const ProgressiveSectionType(this.krString, this.color);
}
