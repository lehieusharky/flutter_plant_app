import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({
    Key? key,
    this.height = 1,
    this.color,
  }) : super(key: key);
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color ?? colorTheme.get495566.withOpacity(0.8)),
              ),
            );
          }),
        );
      },
    );
  }
}
