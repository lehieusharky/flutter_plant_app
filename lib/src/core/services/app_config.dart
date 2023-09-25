import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../di/di.dart';

class AppConfig {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();

    // dependencies injection configuration
    await configureCoreDependencies();

    // firebase initialization
    await Firebase.initializeApp();
  }
}
