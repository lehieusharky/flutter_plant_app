import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.shade200,
      highlightColor: colorTheme.getFFFFFF,
      child: Container(
        width: width,
        height: height,
        color: Colors.black,
      ),
    );
  }
}
