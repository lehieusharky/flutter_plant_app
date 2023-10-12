import 'package:flutter/widgets.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            colorTheme.get2DDA93.withOpacity(0.25),
            colorTheme.get2DDA93.withOpacity(0.23),
            colorTheme.get2DDA93.withOpacity(0.22),
            colorTheme.get2DDA93.withOpacity(0.2),
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
