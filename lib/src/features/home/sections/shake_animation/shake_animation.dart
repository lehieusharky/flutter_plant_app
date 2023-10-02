import 'package:flutter/material.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';

class SharkeAnimationHomePage extends StatefulWidget {
  const SharkeAnimationHomePage({super.key});

  @override
  State<SharkeAnimationHomePage> createState() =>
      _SharkeAnimationHomePageState();
}

class _SharkeAnimationHomePageState extends State<SharkeAnimationHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomLottie(
      path: imageConstant.tree3,
      width: context.width,
      height: context.sizeHeight(250),
    );
  }
}
