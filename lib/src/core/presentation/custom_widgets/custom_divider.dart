import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.8),
    );
  }
}
