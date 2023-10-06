import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../di/di.dart';

class AppConfig {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();

    // init dotenv
    await dotenv.load(fileName: ".env");

    // dependencies injection configuration
    await configureCoreDependencies();

    // firebase initialization
    await Firebase.initializeApp();
  }
}
