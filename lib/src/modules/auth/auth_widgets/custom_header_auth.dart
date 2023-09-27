import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class CustomHeaderAuthentication extends StatelessWidget {
  const CustomHeaderAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),
        context.sizedBox(height: 6),
        _subtitle(context),
      ],
    );
  }

  Widget _title(BuildContext context) => Text(
        translate(context).hello,
        style: AppTextTheme.getDefaultTextTheme(context).titleLarge,
      );

  Widget _subtitle(BuildContext context) => Text(
        translate(context).letsLearnMoreAboutPlants,
        style: AppTextTheme.getDefaultTextTheme(context).titleMedium,
      );
}
