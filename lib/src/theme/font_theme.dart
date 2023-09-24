import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class AppTextTheme {
  static TextTheme getDefaultTextTheme(BuildContext context) => TextTheme(
        displaySmall: TextStyle(
          fontSize: context.sizeWidth(24),
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        titleLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        titleMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        labelLarge: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextTheme getDefaultTextThemeDark() => TextTheme(
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: colorTheme.get2DDA93,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colorTheme.get2DDA93,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colorTheme.get2DDA93,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorTheme.get2DDA93,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorTheme.get2DDA93,
        ),
      );
}
