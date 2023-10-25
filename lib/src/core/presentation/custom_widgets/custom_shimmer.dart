import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  const CustomShimmer({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadow.button(
      boxShadowColor: colorTheme.get6A6F7D.withOpacity(0.1),
      child: Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 1),
        baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
        highlightColor: _hightLightColor(),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: Theme.of(context).canvasColor,
            ),
          ],
        ),
      ),
    );
  }
}

Color _hightLightColor() {
  return sharePreference.isDarkMode()
      ? colorTheme.get0A4D68.withOpacity(0.1)
      : Colors.grey.shade200;
}
