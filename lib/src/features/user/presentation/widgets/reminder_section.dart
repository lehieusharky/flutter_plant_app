import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';

class ReminderSection extends StatelessWidget {
  const ReminderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          'Comming soon...',
          style: theme(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
