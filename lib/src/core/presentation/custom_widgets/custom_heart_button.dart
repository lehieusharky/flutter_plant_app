import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomHeartButton extends StatefulWidget {
  const CustomHeartButton({super.key});

  @override
  State<CustomHeartButton> createState() => _CustomHeartButtonState();
}

class _CustomHeartButtonState extends State<CustomHeartButton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: context.sizeWidth(35),
      circleColor: CircleColor(
        start: colorTheme.getFF6262,
        end: colorTheme.getFF6262,
      ),
      bubblesColor: BubblesColor(
        dotPrimaryColor: colorTheme.getFF6262.withOpacity(0.5),
        dotSecondaryColor: colorTheme.getFF6262,
      ),
      likeBuilder: (bool isLiked) {
        return SvgPicture.asset(
          imageConstant.heartSvg,
          // ignore: deprecated_member_use
          color: isLiked
              ? colorTheme.getFF6262
              : colorTheme.getFFFFFF.withOpacity(0.8),
        );
      },
    );
  }
}
