import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/count_down_ring.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class TreeShakeAnimation extends StatefulWidget {
  final CountDownController countDownController;
  const TreeShakeAnimation({
    super.key,
    required this.countDownController,
  });

  @override
  State<TreeShakeAnimation> createState() => _TreeShakeAnimationState();
}

class _TreeShakeAnimationState extends State<TreeShakeAnimation> {
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
        CustomLottie(
          path: imageConstant.tree2Json,
        ),
        context.sizedBox(height: 55),
      ],
    );
  }

  Widget _buildLand(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(
          path: imageConstant.landSVG,
        ),
        context.sizedBox(height: 15),
      ],
    );
  }

  Widget _buildCircleBackGround(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CountDownRingWidget(countDownController: widget.countDownController),
        Container(
          width: context.sizeWidth(300),
          height: context.sizeHeight(300),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ThemeManager.shadowShakeAnimation(),
                spreadRadius: 5,
                blurRadius: 40,
                offset: const Offset(0, 0),
              ),
            ],
            color: const Color(0xffB0D9B1),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
