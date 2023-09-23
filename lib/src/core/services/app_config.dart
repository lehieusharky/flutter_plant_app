import 'package:flutter/material.dart';

import '../di/di.dart';

class AppConfig {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureCoreDependencies();
  }
}