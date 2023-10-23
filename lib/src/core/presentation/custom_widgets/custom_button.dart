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
  final BorderSide? borderSide;
  final double? verticalPadding;

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
    this.borderSide,
    this.verticalPadding,
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
            side: borderSide ?? const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10),
          child: child,
        ),
      ),
    );
  }

  factory CustomButton.send({
    required BuildContext context,
    final double? width,
    required void Function() onPressed,
    String? title,
  }) {
    return CustomButton(
      width: width ?? context.width,
      height: context.sizeHeight(55),
      onPress: onPressed,
      backgroundColor: colorTheme.get2DDA93,
      boxShadowColor: colorTheme.getD2D2D2.withOpacity(0.5),
      borderRadius: 5,
      child: Text(
        title ?? translate(context).send,
        style: AppTextTheme.darkTheme(context).titleLarge,
      ),
    );
  }
}
