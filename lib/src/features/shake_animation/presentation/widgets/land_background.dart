import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class LandBackGroundWidget extends StatelessWidget {
  const LandBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildCircleBackGround(context),
        _buildLand(context),
        _buildTree(context),
      ],
    );
  }

  Widget _buildTree(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomLottie(path: imageConstant.tree2Json),
        context.sizedBox(height: 40),
      ],
    );
  }

  Widget _buildLand(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(path: imageConstant.landSVG),
        context.sizedBox(height: 5),
      ],
    );
  }

  Widget _buildCircleBackGround(BuildContext context) {
    return Container(
      width: context.sizeWidth(300),
      height: context.sizeHeight(300),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeManager.shadowButton().withOpacity(0.8),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
        color: const Color(0xffB0D9B1),
        shape: BoxShape.circle,
      ),
    );
  }
}
