import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/entities/weather_entity.dart';

class AppConfig {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();

    // hive regis adapter
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(MainAdapter());
    Hive.registerAdapter(WindAdapter());

    await Hive.initFlutter();
    await Hive.openBox('weather');

    // init dotenv
    await dotenv.load(fileName: ".env");

    // dependencies injection configuration
    await configureCoreDependencies();

    // firebase initialization
    await Firebase.initializeApp();
  }
}
