import 'package:flutter/material.dart';
import 'package:plant_market/my_app.dart';
import 'package:plant_market/src/core/services/app_config.dart';

Future<void>  main() async {
  await AppConfig.config();
  runApp(const MyApp());
}