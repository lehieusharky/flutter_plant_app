import 'package:flutter/material.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(imageConstant.testImage),
            ),
            Container(
              width: context.sizeWidth(100),
              height: context.sizeHeight(50),
              color: Colors.red,
            ),
            Text(
              'Hello World',
              style: AppTextTheme.getDefaultTextTheme(context).bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
