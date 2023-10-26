import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';

class ZoomOutCreateTimelineButton extends StatelessWidget {
  final double? opacity;
  final void Function() onPressed;

  const ZoomOutCreateTimelineButton({
    super.key,
    this.opacity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 10, horizontal: 20),
      child: CreateTimelineButton.customSize(
        context: context,
        onPressed: onPressed,
        iconSize: context.sizeWidth(15),
        opacity: opacity,
        width: context.sizeWidth(45),
        height: context.sizeWidth(45),
        title: '',
      ),
    );
  }
}
