import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';

class PlantIdentifyModal extends StatelessWidget {
  const PlantIdentifyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'plant identify',
      style: theme(context).textTheme.titleMedium,
    );
  }
}
