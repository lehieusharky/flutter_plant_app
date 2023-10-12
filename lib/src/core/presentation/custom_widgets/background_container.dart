import 'package:flutter/widgets.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            colorTheme.get2DDA93.withOpacity(0.19),
            colorTheme.get2DDA93.withOpacity(0.18),
            colorTheme.get2DDA93.withOpacity(0.16),
            colorTheme.get2DDA93.withOpacity(0.15),
            colorTheme.get2DDA93.withOpacity(0.1),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.05),
            colorTheme.get2DDA93.withOpacity(0.01),
            colorTheme.get2DDA93.withOpacity(0.01),
            colorTheme.get2DDA93.withOpacity(0.01),
            colorTheme.get2DDA93.withOpacity(0.01),
            colorTheme.get2DDA93.withOpacity(0.01),
          ])),
    );
  }
}
