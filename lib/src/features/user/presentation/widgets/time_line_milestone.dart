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
        _buildCircle(context),
        context.sizedBox(height: 5),
        _buildLine(context: context, color: colorTheme.get2DDA93),
      ],
    );
  }

  Widget _buildLine({required BuildContext context, required Color color}) {
    return Container(
      width: 4,
      height: context.sizeHeight(240),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          context.sizeWidth(20),
        ),
      ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    return Container(
      width: context.sizeWidth(15),
      height: context.sizeWidth(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorTheme.get2DDA93,
      ),
    );
  }
}
