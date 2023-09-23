import 'package:flutter/material.dart';
import 'package:plant_market/src/modules/auth/login/pages/home_page.dart';

class MyApp extends StatelessWidget {   
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
