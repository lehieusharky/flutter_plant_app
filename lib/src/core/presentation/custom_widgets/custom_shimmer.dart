import 'package:flutter/material.dart';
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
      baseColor: Theme.of(context).scaffoldBackgroundColor,
      highlightColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Theme.of(context).canvasColor,
          ),
        ],
      ),
    );
  }
}
