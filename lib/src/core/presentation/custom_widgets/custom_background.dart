import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class Custombackground extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double? borderRadius;
  const Custombackground({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: colorTheme.getFFFFFF, width: 0.5),
        borderRadius: BorderRadius.circular(borderRadius ?? 24),
        color: ThemeManager.backgroundButton().withOpacity(0.7),
      ),
      child: child,
    );
  }
}
