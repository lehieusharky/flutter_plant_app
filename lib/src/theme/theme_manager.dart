import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class ThemeManager {
  static Color backgroundButton() {
    if (sharePreference.isDarkMode()) {
      return colorTheme.get252A3D;
    } else {
      return colorTheme.getFFFFFF;
    }
  }

  static String backgroundJSon() {
    if (sharePreference.isDarkMode()) {
      return imageConstant.nightJson;
    } else {
      return imageConstant.trainJson;
    }
  }

  static Color shadowButton() {
    return colorTheme.getD2D2D2
        .withOpacity(sharePreference.isDarkMode() ? 0 : 0.4);
  }

  static Color shadowShakeAnimation() {
    if (sharePreference.isDarkMode()) {
      return colorTheme.getFFFFFF.withOpacity(0.4);
    } else {
      return colorTheme.get6A6F7D.withOpacity(0.45);
    }
  }
}
