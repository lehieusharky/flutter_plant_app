import 'package:flutter/material.dart';

class PlantSpecialItem extends StatelessWidget {
  final String title;
  const PlantSpecialItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(color: Colors.white));
  }
}
