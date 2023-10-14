import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/audio_constant.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/count_down.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/land_background.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class ShakeAnimationPage extends BaseWidget {
  const ShakeAnimationPage({super.key});

  @override
  BaseWidgetState createState() => _ShakeAnimationPageState();
}

class _ShakeAnimationPageState extends BaseWidgetState {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();

    assetsAudioPlayer.open(
      Audio(audioConstant.chillMp3),
      autoStart: true,
      loopMode: LoopMode.single,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  Container(
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
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LandBackGroundWidget(),
                      context.sizedBox(height: 5),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomLottie(path: imageConstant.tree2Json),
                      context.sizedBox(height: 40),
                    ],
                  ),
                ],
              ),
              context.sizedBox(height: 15),
              const CountDownWidget(),
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
                  style: AppTextTheme.lightTheme(context).headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
