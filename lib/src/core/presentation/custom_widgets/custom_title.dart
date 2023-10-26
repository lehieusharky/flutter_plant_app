import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? horizontalPadding;
  final Color? color;
  const CustomTitle({
    super.key,
    required this.title,
    this.horizontalPadding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: horizontalPadding ?? 0),
      child: SizedBox(
        height: context.sizeHeight(20),
        child: Text(
          title,
          style: theme(context).textTheme.titleMedium!.copyWith(
                color: color,
                fontSize: context.sizeWidth(15),
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
