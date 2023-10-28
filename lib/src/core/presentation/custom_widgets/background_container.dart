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
            colorTheme.get2DDA93.withOpacity(0.085),
            colorTheme.get2DDA93.withOpacity(0.08),
            colorTheme.get2DDA93.withOpacity(0.075),
            colorTheme.get2DDA93.withOpacity(0.07),
            colorTheme.get2DDA93.withOpacity(0.065),
            colorTheme.get2DDA93.withOpacity(0.06),
            colorTheme.get2DDA93.withOpacity(0.055),
            colorTheme.get2DDA93.withOpacity(0.04),
            colorTheme.get2DDA93.withOpacity(0.035),
          ])),
    );
  }
}
