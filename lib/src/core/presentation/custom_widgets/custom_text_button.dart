import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final double? opacity;
  final void Function()? onPressed;
  const CustomTextButton({
    super.key,
    required this.title,
    this.opacity,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: theme(context).textTheme.titleMedium!.copyWith(
              color: theme(context)
                  .textTheme
                  .titleMedium!
                  .color!
                  .withOpacity(opacity ?? 0),
            ),
      ),
    );
  }

  factory CustomTextButton.cancel(BuildContext context) {
    return CustomTextButton(
      title: translate(context).cancel,
      onPressed: () => Navigator.pop(context),
      opacity: 0.6,
    );
  }

  factory CustomTextButton.save({
    required BuildContext context,
    void Function()? onPressed,
  }) {
    return CustomTextButton(
      title: translate(context).save,
      onPressed: onPressed,
      opacity: 1,
    );
  }
}
