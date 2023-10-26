import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomSnakBar {
  static showSnackbar({
    required BuildContext context,
    required String message,
    void Function()? onVisible,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: backgroundColor,
        onVisible: onVisible,
        content: Center(
          child: Text(
            message,
            style: theme(context).textTheme.titleMedium!.copyWith(
                  fontSize: context.sizeWidth(17),
                  color: colorTheme.getFFFFFF,
                ),
          ),
        ),
      ),
    );
  }
}
