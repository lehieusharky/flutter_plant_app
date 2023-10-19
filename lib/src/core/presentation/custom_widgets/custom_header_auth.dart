import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class CustomHeaderAuthentication extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomHeaderAuthentication({
    super.key,
    required this.title,
    required this.subTitle,
  });

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
        title,
        style: theme(context).textTheme.headlineMedium,
      );

  Widget _subtitle(BuildContext context) => Text(
        subTitle,
        style: theme(context).textTheme.titleLarge,
      );
}
