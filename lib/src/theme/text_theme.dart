import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class AppTextTheme {
  static TextTheme lightTheme(BuildContext context) => TextTheme(
        // * display
        displayLarge: GoogleFonts.openSans(
          color: Colors.blue,
          fontSize: 30,
        ),
        displayMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(70),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        displaySmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(50),
          fontWeight: FontWeight.w700,
          color: colorTheme.get36455A,
        ),

        // * headline
        headlineLarge: GoogleFonts.openSans(),
        headlineMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(30),
          fontWeight: FontWeight.w700,
          color: colorTheme.get36455A,
        ),
        headlineSmall: GoogleFonts.openSans(),

        // * title
        titleLarge: GoogleFonts.openSans(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w400,
          color: colorTheme.get36455A,
        ),
        titleMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(15),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
        ),
        titleSmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(11),
          fontWeight: FontWeight.w400,
          color: colorTheme.get36455A,
        ),

        // * label
        labelLarge: GoogleFonts.openSans(),
        labelMedium: GoogleFonts.openSans(),
        labelSmall: GoogleFonts.openSans(),

        // * body
        bodyLarge: GoogleFonts.openSans(),
        bodyMedium: GoogleFonts.openSans(),
        bodySmall: GoogleFonts.openSans(),
      );

  static TextTheme darkTheme(BuildContext context) => TextTheme(
        // * display
        displayLarge: GoogleFonts.openSans(color: Colors.yellow, fontSize: 20),
        displayMedium: GoogleFonts.roboto(
          fontSize: context.sizeWidth(70),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        displaySmall: GoogleFonts.openSans(),

        // * headline
        headlineLarge: GoogleFonts.openSans(),
        headlineMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(30),
          fontWeight: FontWeight.w700,
          color: colorTheme.getFFFFFF,
        ),
        headlineSmall: GoogleFonts.openSans(),

        // * title
        titleLarge: GoogleFonts.openSans(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        titleMedium: GoogleFonts.openSans(
          fontSize: context.sizeWidth(15),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        titleSmall: GoogleFonts.openSans(
          fontSize: context.sizeWidth(11),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),

        // * label
        labelLarge: GoogleFonts.openSans(),
        labelMedium: GoogleFonts.openSans(),
        labelSmall: GoogleFonts.openSans(),

        // * body
        bodyLarge: GoogleFonts.openSans(),
        bodyMedium: GoogleFonts.openSans(),
        bodySmall: GoogleFonts.openSans(),
      );
}
