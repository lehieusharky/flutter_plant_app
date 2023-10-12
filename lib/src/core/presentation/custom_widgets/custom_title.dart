import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 12),
      child: Text(
        title,
        style: theme(context).textTheme.titleMedium!.copyWith(
              fontSize: context.sizeWidth(18),
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
