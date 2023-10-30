import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
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
    return Padding(
      padding: context.padding(all: 3),
      child: LikeButton(
        mainAxisAlignment: MainAxisAlignment.end,
        size: context.sizeWidth(40),
        circleColor: CircleColor(
          start: colorTheme.get2DDA93,
          end: colorTheme.get2DDA93,
        ),
        bubblesColor: BubblesColor(
          dotPrimaryColor: colorTheme.get2DDA93.withOpacity(0.5),
          dotSecondaryColor: colorTheme.get2DDA93,
        ),
        likeBuilder: (bool isLiked) {
          return SvgPicture.asset(
            imageConstant.heartSvg,
            // ignore: deprecated_member_use
            color: isLiked
                ? colorTheme.get2DDA93.withOpacity(0.8)
                : colorTheme.getFFFFFF.withOpacity(0.8),
          );
        },
      ),
    );
  }
}
