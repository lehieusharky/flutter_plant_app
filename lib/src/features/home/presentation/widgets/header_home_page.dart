import 'package:flutter/material.dart';
import 'package:plant_market/src/features/home/presentation/widgets/weather_home_page.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({super.key});

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        WeatherHomeage(),
      ],
    );
  }
}
