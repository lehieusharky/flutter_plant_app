import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class PlantName extends StatelessWidget {
  final String plantName;
  const PlantName({
    super.key,
    required this.plantName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      plantName,
      style: theme(context).textTheme.titleLarge!.copyWith(
            fontSize: context.sizeWidth(20),
          ),
    );
  }
}
