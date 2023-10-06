import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class BackGroundContainer extends StatelessWidget {
  final Color color;
  const BackGroundContainer({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: context.width,
      height: context.sizeHeight(175),
    );
  }
}
