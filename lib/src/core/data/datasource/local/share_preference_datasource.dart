import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/di/di.dart';

SharePreferenceDataSource get sharePreference =>
    injector.get<SharePreferenceDataSource>();

abstract class SharePreferenceDataSource {
  bool isDarkMode();

  SupportedTheme getTheme();

  String getLanguage();

  Future<bool?> setTheme(String? data);

  Future<bool?> setLanguage(String? data);

  bool isFirstTimeOpenApp();

  void setIsFirstTimeOpenApp();

  bool isLoggedIn();

  Future<void> setIsLoggedIn({required bool status});
}
