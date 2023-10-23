import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';

class TitleSettingField extends StatelessWidget {
  final String title;
  const TitleSettingField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomTitle(
      title: title,
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.6),
    );
  }
}
