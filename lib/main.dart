import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/features/my_app/presentation/page/my_app.dart';
import 'package:plant_market/src/core/services/app_config.dart';

Future<void> main() async {
  await AppConfig.config();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}
