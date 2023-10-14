import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';

class LandBackGroundWidget extends StatelessWidget {
  const LandBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSvg(path: imageConstant.landSVG);
  }
}
