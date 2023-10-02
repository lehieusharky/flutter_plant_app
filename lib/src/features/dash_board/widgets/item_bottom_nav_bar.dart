import 'package:flutter/material.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

SalomonBottomBarItem itemBottomNavigationBar({
  required Widget icon,
  required String title,
  required Color selectedColor,
  required Color unSelectedColor,
}) =>
    SalomonBottomBarItem(
      icon: icon,
      title: Text(title),
      selectedColor: selectedColor,
      unselectedColor: colorTheme.getD2D2D2,
    );

SalomonBottomBarItem itemBottomGreen({
  required Widget icon,
  required String title,
}) =>
    itemBottomNavigationBar(
      icon: icon,
      title: title,
      selectedColor: colorTheme.get2DDA93,
      unSelectedColor: colorTheme.getD2D2D2,
    );
