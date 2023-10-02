import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final TextStyle? textStyleText;
  final double borderRadius;
  final Widget child;
  final Color? boxShadowColor;

  const CustomButton({
    super.key,
    required this.onPress,
    required this.backgroundColor,
    this.textStyleText,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
    this.boxShadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadow.button(
      width: width,
      boxShadowColor: boxShadowColor ?? Colors.transparent,
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
