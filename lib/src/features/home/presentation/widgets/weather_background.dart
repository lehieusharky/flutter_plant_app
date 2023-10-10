import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WeatherBackGround extends StatelessWidget {
  const WeatherBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      backgroundImage: DecorationImage(
          image: AssetImage(_isNightOrSunny()
              ? imageConstant.nightImage
              : imageConstant.sunnyImage)),
      config: CustomConfig(
        colors: [
          colorTheme.get2DDA93,
          colorTheme.get2DDA93.withOpacity(0.7),
          colorTheme.getFFFFFF.withOpacity(0.4),
          colorTheme.get2DDA93.withOpacity(0.5),
          colorTheme.getFFFFFF.withOpacity(0.5),
        ],
        durations: [
          118000,
          15000,
          9000,
          9000,
          10000,
        ],
        heightPercentages: [
          0.95,
          0.5,
          0.68,
          0.4,
          0.70,
        ],
      ),
      size: Size(context.width, context.sizeHeight(175)),
      waveAmplitude: 0,
    );
  }

  bool _isNightOrSunny() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int sunsetHour = 18; // 6:00 PM
    int sunriseHour = 6; // 6:00 AM
    if (currentHour >= sunsetHour || currentHour < sunriseHour) {
      // It's night
      return true;
    } else {
      // It's sunny
      return false;
    }
  }
}
