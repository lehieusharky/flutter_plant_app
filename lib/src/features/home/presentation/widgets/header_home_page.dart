import 'package:flutter/material.dart';
import 'package:plant_market/src/features/home/presentation/widgets/weather_home_page.dart';

class HeaderHomePage extends StatefulWidget {
  final TextEditingController searchController;
  const HeaderHomePage({
    super.key,
    required this.searchController,
  });

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const WeatherHomeage(),
      ],
    );
  }
}
