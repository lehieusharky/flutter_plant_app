import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        translate(context).cancel,
        style: theme(context).textTheme.titleMedium!.copyWith(
            color:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.6)),
      ),
    );
  }
}
