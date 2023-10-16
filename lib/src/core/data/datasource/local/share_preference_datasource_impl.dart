import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/constants/share_preference_key.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SharePreferenceDataSource)
class SharePreferenceDataSouceImpl implements SharePreferenceDataSource {
  final SharedPreferences _prefs = injector.get<SharedPreferences>();

  @override
  SupportedTheme getTheme() {
    final theme = _prefs.getString(PreferencesKey.theme);
    if (theme == null || theme == SupportedTheme.light.name) {
      return SupportedTheme.light;
    }
    return SupportedTheme.dark;
  }

  @override
  Future<bool?> setTheme(String? data) async {
    if (data == null) {
      return _prefs.remove(PreferencesKey.theme);
    }
    return _prefs.setString(PreferencesKey.theme, data);
  }

  @override
  bool isDarkMode() {
    final theme = _prefs.getString(PreferencesKey.theme);
    if (theme == SupportedTheme.dark.name) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool?> setLanguage(String? data) {
    if (data == null) {
      return _prefs.remove(PreferencesKey.language);
    }
    return _prefs.setString(PreferencesKey.language, data);
  }

  @override
  bool isFirstTimeOpenApp() {
    final isFirstTimeOpenApp = _prefs.getBool(PreferencesKey.firstTimeOpenApp);
    if (isFirstTimeOpenApp == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String getLanguage() {
    final languageCode = _prefs.getString(PreferencesKey.language);
    if (languageCode == null || languageCode == AppConstant.vi) {
      return AppConstant.vi;
    } else {
      return AppConstant.en;
    }
  }

  @override
  void setIsFirstTimeOpenApp() {
    _prefs.setBool(PreferencesKey.firstTimeOpenApp, true);
  }

  @override
  bool isLoggedIn() {
    final isLoggedIn = _prefs.getBool(PreferencesKey.isLoggedIn);
    return isLoggedIn ?? false;
  }

  @override
  Future<void> setIsLoggedIn({required bool status}) async {
    await _prefs.setBool(PreferencesKey.isLoggedIn, status);
  }
}
