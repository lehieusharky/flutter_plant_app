import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';

extension SupportedThemeExt on SupportedTheme {
  String get name {
    switch (this) {
      case SupportedTheme.light:
        return AppConstant.light;
      case SupportedTheme.dark:
        return AppConstant.dark;
      default:
        return AppConstant.light;
    }
  }
}
