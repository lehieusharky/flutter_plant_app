import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class TimeLineMineStone extends StatelessWidget {
  final int index;
  final bool isFirstItem;
  final int lengthOfListTimeLine;

  const TimeLineMineStone({
    super.key,
    required this.index,
    required this.isFirstItem,
    required this.lengthOfListTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        index != 0
            ? _buildLine(
                context: context,
                color: colorTheme.get2DDA93,
              )
            : const SizedBox(),
        context.sizedBox(height: 2),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCircle(context),
            context.sizedBox(height: 2),
            _buildLine(
              context: context,
              color: !isFirstItem ? colorTheme.get2DDA93 : Colors.transparent,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildLine({required BuildContext context, required Color color}) {
    return Container(
      width: 4,
      height: context.sizeHeight(230 / 2),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    return Container(
      width: context.sizeWidth(12),
      height: context.sizeWidth(12),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lengthOfListTimeLine == 1
              ? Colors.transparent
              : colorTheme.get2DDA93),
    );
  }
}
