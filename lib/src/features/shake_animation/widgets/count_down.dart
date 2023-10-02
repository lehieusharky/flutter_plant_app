import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '90',
          style: AppTextTheme.getDefaultTextTheme(context).headlineLarge,
        ),
        Text(
          ':',
          style: AppTextTheme.getDefaultTextTheme(context).headlineLarge,
        ),
        Text(
          '00',
          style: AppTextTheme.getDefaultTextTheme(context).headlineLarge,
        ),
      ],
    );
  }
}
