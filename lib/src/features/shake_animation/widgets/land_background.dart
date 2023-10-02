import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class LandBackGround extends StatelessWidget {
  const LandBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeWidth(250),
      height: context.sizeHeight(250),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorTheme.get36455A.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: _randomRadius(),
          topLeft: _randomRadius(),
          bottomLeft: _randomRadius(),
          bottomRight: _randomRadius(),
        ),
        color: colorTheme.get2DDA93,
      ),
    );
  }

  Radius _randomRadius() {
    return Radius.circular(_radomBorderRadius());
  }

  double _radomBorderRadius() {
    return Random().nextInt(351) + 50;
  }
}
