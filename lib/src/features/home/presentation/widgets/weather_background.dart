import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class WeatherBacground extends StatelessWidget {
  const WeatherBacground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _backgroundImage(),
      width: context.width,
      height: context.sizeHeight(180),
    );
  }

  String _backgroundImage() {
    return _isNightTime() ? imageConstant.nightImage : imageConstant.sunnyImage;
  }

  bool _isNightTime() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int sunsetHour = 18; // 6:00 PM
    int sunriseHour = 6; // 6:00 AM
    if (currentHour >= sunsetHour || currentHour < sunriseHour) {
      return true;
    } else {
      return false;
    }
  }
}
