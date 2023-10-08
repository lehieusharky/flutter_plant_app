import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final double borderRadius;
  final Widget child;
  final Color? boxShadowColor;
  final Color? foregroundColor;

  const CustomButton({
    super.key,
    required this.onPress,
    required this.backgroundColor,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
    this.boxShadowColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadow.button(
      width: width,
      height: height,
      boxShadowColor: boxShadowColor ?? Colors.transparent,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
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

  factory CustomButton.send({
    required BuildContext context,
    required void Function() onPressed,
  }) {
    return CustomButton(
      width: context.width,
      height: context.sizeHeight(55),
      onPress: onPressed,
      backgroundColor: colorTheme.get2DDA93,
      boxShadowColor: colorTheme.getD2D2D2.withOpacity(0.5),
      borderRadius: 5,
      child: Text(
        translate(context).send,
        style: AppTextTheme.darkTheme(context).titleLarge,
      ),
    );
  }
}
