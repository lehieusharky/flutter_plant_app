import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_shimmer.dart';

class CustomCatchedNetWorkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? opacity;

  const CustomCatchedNetWorkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            opacity: opacity ?? 1,
          ),
        ),
      ), 
      placeholder: (context, url) => CustomShimmer(
        width: width,
        height: height,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
