import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String path;
  final ColorFilter? colorFilter;
  final String? semanticsLabel;
  final Color? color;
  final double? width;
  final double? height;
  const CustomSvg({
    super.key,
    this.colorFilter,
    required this.path,
    this.semanticsLabel,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: colorFilter,
      // ignore: deprecated_member_use
      color: color,
      width: width,
      height: height,
      semanticsLabel: semanticsLabel,
    );
  }
}
