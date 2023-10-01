import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final TextStyle? textStyleText;
  final double borderRadius;
  final Widget child;
  final Color shadowColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPress,
    required this.backgroundColor,
    this.textStyleText,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 4,
            blurRadius: 12,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: child,
        ),
      ),
    );
  }
}
