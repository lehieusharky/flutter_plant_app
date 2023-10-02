import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String path;
  final ColorFilter? colorFilter;
  final String? semanticsLabel;
  const CustomSvg({
    super.key,
    this.colorFilter,
    required this.path,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: colorFilter,
      semanticsLabel: semanticsLabel,
    );
  }
}
