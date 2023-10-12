import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color boxShadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;

  const CustomShadow({
    super.key,
    required this.child,
    this.width,
    this.height,
    required this.boxShadowColor,
    required this.spreadRadius,
    required this.blurRadius,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }

  factory CustomShadow.button({
    required Widget child,
    double? width,
    double? height,
    required Color boxShadowColor,
  }) {
    return CustomShadow(
      width: width,
      height: height,
      boxShadowColor: boxShadowColor,
      spreadRadius: 1,
      blurRadius: 7,
      offset: const Offset(0, 1),
      child: child,
    );
  }

  factory CustomShadow.textFormField({
    required Widget child,
    double? width,
    double? height,
    required Color boxShadowColor,
  }) {
    return CustomShadow(
      width: width,
      height: height,
      boxShadowColor: boxShadowColor,
      spreadRadius: 1,
      blurRadius: 7,
      offset: const Offset(0, 1),
      child: child,
    );
  }
}
