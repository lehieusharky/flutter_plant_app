import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/my_app/data/datasources/local/system_datasource.dart';

@Injectable(as: SystemDataSource)
class SystemDataSourceImpl implements SystemDataSource {
  @override
  String systemLanguage() {
    final languageCode = Platform.localeName.split('_')[0];
    return languageCode;
  }

  @override
  ThemeMode systemThemeMode() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    if (brightness == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
