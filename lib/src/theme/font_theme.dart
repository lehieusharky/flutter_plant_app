import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class AppTextTheme {
  static TextTheme getDefaultTextTheme(BuildContext context) => TextTheme(
        displaySmall: TextStyle(
          fontSize: context.sizeWidth(24),
          fontWeight: FontWeight.bold,
          color: colorTheme.get2DDA93,
        ),
        displayMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(13),
          fontWeight: FontWeight.w400,
          color: colorTheme.getD2D2D2,
        ),
        headlineMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w600,
          color: colorTheme.get36455A,
        ),
        headlineSmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(20),
          fontWeight: FontWeight.w600,
          color: colorTheme.getFFFFFF,
        ),
        headlineLarge: GoogleFonts.openSans(
          fontSize: context.sizeWidth(50),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
        ),
        titleLarge: GoogleFonts.openSans(
          fontSize: context.sizeWidth(30),
          fontWeight: FontWeight.w700,
          color: colorTheme.get36455A,
        ),
        labelMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(11),
          fontWeight: FontWeight.w600,
          color: colorTheme.getFFFFFF,
        ),
        titleMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(16),
          fontWeight: FontWeight.w400,
          color: colorTheme.get495566WithOpacity80,
        ),
        labelSmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(10),
          fontWeight: FontWeight.w600,
          color: colorTheme.get6A6F7D,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w600,
          color: colorTheme.getFFFFFF,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(14),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(14),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
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
