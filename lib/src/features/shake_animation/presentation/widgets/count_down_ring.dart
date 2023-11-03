import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CountDownRingWidget extends StatelessWidget {
  final double value;

  const CountDownRingWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeWidth(248),
      height: context.sizeHeight(248),
      child: CircularProgressIndicator(
        value: value / 100,
        strokeWidth: context.sizeWidth(8),
        backgroundColor: Colors.transparent,
        color: sharePreference.isDarkMode()
            ? colorTheme.get2DDA93
            : const Color(0xff00FFCA),
      ),
    );
  }
}
