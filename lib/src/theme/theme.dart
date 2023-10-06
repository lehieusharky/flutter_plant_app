import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/text_theme.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTheme(context),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.darkTheme(context),
    );
