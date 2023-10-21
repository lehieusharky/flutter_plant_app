import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class CustomTabChild extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final double? height;
  final Widget? child;
  final Widget? icon;

  const CustomTabChild({
    super.key,
    required this.title,
    this.iconData,
    this.height,
    this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 10),
      child: Tab(
        icon: icon,
        height: height,
        text: title,
        child: child,
      ),
    );
  }
}
