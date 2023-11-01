import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class AppTextTheme {
  static TextTheme lightTheme(BuildContext context) => TextTheme(
        // * display
        displayLarge: GoogleFonts.lato(
          color: Colors.blue,
          fontSize: 30,
        ),
        displayMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(85),
          fontWeight: FontWeight.w400,
          color: colorTheme.get495566,
        ),
        displaySmall: GoogleFonts.lato(
          fontSize: context.sizeWidth(50),
          fontWeight: FontWeight.w700,
          color: colorTheme.get36455A,
        ),

        // * headline
        headlineLarge: GoogleFonts.lato(),
        headlineMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(30),
          fontWeight: FontWeight.w700,
          color: colorTheme.get36455A,
        ),
        headlineSmall: GoogleFonts.lato(),

        // * title
        titleLarge: GoogleFonts.lato(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(15),
          fontWeight: FontWeight.w500,
          color: colorTheme.get36455A,
        ),
        titleSmall: GoogleFonts.lato(
          fontSize: context.sizeWidth(14),
          fontWeight: FontWeight.w400,
          color: colorTheme.get6A6F7D,
        ),

        // * label
        labelLarge: GoogleFonts.lato(),
        labelMedium: GoogleFonts.lato(),
        labelSmall: GoogleFonts.lato(),

        // * body
        bodyLarge: GoogleFonts.lato(),
        bodyMedium: GoogleFonts.lato(),
        bodySmall: GoogleFonts.lato(),
      );

  static TextTheme darkTheme(BuildContext context) => TextTheme(
        // * display
        displayLarge: GoogleFonts.lato(
          color: Colors.yellow,
          fontSize: 20,
        ),
        displayMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(85),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        displaySmall: GoogleFonts.lato(),

        // * headline
        headlineLarge: GoogleFonts.lato(),
        headlineMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(30),
          fontWeight: FontWeight.w700,
          color: colorTheme.getFFFFFF,
        ),
        headlineSmall: GoogleFonts.lato(),

        // * title
        titleLarge: GoogleFonts.lato(
          fontSize: context.sizeWidth(18),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: context.sizeWidth(15),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),
        titleSmall: GoogleFonts.lato(
          fontSize: context.sizeWidth(14),
          fontWeight: FontWeight.w400,
          color: colorTheme.getFFFFFF,
        ),

        // * label
        labelLarge: GoogleFonts.lato(),
        labelMedium: GoogleFonts.lato(),
        labelSmall: GoogleFonts.lato(),

        // * body
        bodyLarge: GoogleFonts.lato(),
        bodyMedium: GoogleFonts.lato(),
        bodySmall: GoogleFonts.lato(),
      );
}
