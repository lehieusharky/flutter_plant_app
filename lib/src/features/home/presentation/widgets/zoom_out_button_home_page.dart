import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';

class ZoomOutButtonHomePage extends StatelessWidget {
  const ZoomOutButtonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          context: context,
          iconPath: imageConstant.cameraSVG,
          onPressed: () {},
        ),
        context.sizedBox(width: 20),
        _buildIconButton(
          context: context,
          iconPath: imageConstant.communitySVG,
          onPressed: () {},
        ),
        context.sizedBox(width: 20),
        _buildIconButton(
          context: context,
          iconPath: imageConstant.gallerySVG,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required void Function() onPressed,
    required BuildContext context,
    required String iconPath,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: CustomSvg(
        path: iconPath,
        width: context.sizeWidth(28),
      ),
    );
  }
}
