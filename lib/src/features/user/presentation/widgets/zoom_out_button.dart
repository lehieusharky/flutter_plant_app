import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';

class ZoomOutButton extends StatelessWidget {
  final double? opacity;
  final void Function() onPressed;
  final String iconPath;
  final double? borderRadius;

  const ZoomOutButton({
    super.key,
    this.opacity,
    required this.onPressed,
    required this.iconPath,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 10, horizontal: 10),
      child: CreateTimelineButton.customSize(
        context: context,
        onPressed: onPressed,
        iconSize: context.sizeWidth(15),
        opacity: opacity,
        width: context.sizeWidth(40),
        height: context.sizeWidth(40),
        title: '',
        iconPath: iconPath,
        borderRadius: borderRadius,
      ),
    );
  }
}
