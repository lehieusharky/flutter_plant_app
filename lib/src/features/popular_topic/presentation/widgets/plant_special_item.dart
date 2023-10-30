import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';

class PlantSpecialItem extends StatelessWidget {
  final String title;
  const PlantSpecialItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: theme(context).textTheme.titleMedium,
    );
  }
}
