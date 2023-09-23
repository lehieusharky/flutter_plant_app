import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di.dart';

ThemeColor get themeColor => injector.get<ThemeColor>();

abstract class ThemeColor {
  final white = Colors.white;
  final transparent = Colors.transparent;

  Color get primaryColor;

  Color get primaryColorLight;

  final lightGray = const Color(0xFFEAE9E9);

  final cardBackground = const Color(0xFFf7f8f8);
  final scaffoldBackgroundColor = const Color(0xFFF6F7FB);

  Color get iconSelected => primaryColor;
  final iconUnselected = Colors.grey;
  final lightGrey = const Color(0xFFbebebe);
  final greyDC = const Color(0xFFdcdcdc);
  final black = const Color(0xFF2F4858);
  final greyE5 = const Color(0xFFE5E5E5);

  //HEX code color
  final colorF3F3F3 = const Color(0xFFF3F3F3);


  final inactiveColor = const Color(0xFF111111);

  Color get activeColor => primaryColor;
  final warningTextColor = const Color(0xFFFF9B1A);

  final titleMenu = Colors.grey;
  final primaryIcon = Colors.grey;
  final green = const Color(0xFF4d9e53);
  final red = const Color(0xFFfb4b53);
  final orange = const Color(0xFFff9b1a);
  final darkBlue = const Color(0xFF002d41);

  //light
  Color get primaryText => color272729;
  final subText = const Color(0xFF767676);
  final fillColorTextField = const Color(0xFFF0F0F0);
  final linkText = const Color(0xFF3680D8);

  //dart
  final primaryDarkText = Colors.black;
  final subDarkText = Colors.grey;
  final text = const Color(0xFF666666);

  final gallery = const Color(0xFFEFEFEF);
  final grayF6F7FB = const Color(0xFFF6F7FB);
  final grayAD = const Color(0xFFADADAD);
  final color272729 = const Color(0xFF272727);

}
