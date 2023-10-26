import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';

class CustomSeperator extends StatelessWidget {
  const CustomSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '________',
      style: theme(context).textTheme.titleMedium,
    );
  }
}
