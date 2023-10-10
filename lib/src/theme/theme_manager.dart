import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class ThemeManager {
  static Color backgroundButton() {
    if (sharePreference.isDarkMode()) {
      return colorTheme.get252A3D;
    } else {
      return colorTheme.getFFFFFF;
    }
  }

  static Color shadowButton() {
    return colorTheme.getD2D2D2
        .withOpacity(sharePreference.isDarkMode() ? 0 : 0.4);
  }
}
