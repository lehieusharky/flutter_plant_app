import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';
import 'package:plant_market/src/features/shake_animation/widgets/count_down.dart';
import 'package:plant_market/src/features/shake_animation/widgets/land_background.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class ShakeAnimationPage extends StatefulWidget {
  const ShakeAnimationPage({super.key});

  @override
  State<ShakeAnimationPage> createState() => _ShakeAnimationPageState();
}

class _ShakeAnimationPageState extends State<ShakeAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.sizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => context.pop(true),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: context.sizeWidth(40),
                    color: colorTheme.get36455A,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const LandBackGround(),
                CustomLottie(
                  path: imageConstant.tree3,
                  width: context.width,
                  height: context.sizeHeight(400),
                ),
              ],
            ),
            context.sizedBox(height: 15),
            const CountDown(),
            context.sizedBox(height: 10),
            CustomButton(
              width: context.sizeWidth(150),
              height: context.sizeHeight(60),
              boxShadowColor: colorTheme.get2DDA93.withOpacity(0.4),
              onPress: () {},
              backgroundColor: colorTheme.get2DDA93,
              borderRadius: context.sizeWidth(10),
              child: Text(
                translate(context).plant,
                style: AppTextTheme.getDefaultTextTheme(context).headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
