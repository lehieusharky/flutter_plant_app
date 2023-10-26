import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CreateTimelineButton extends StatelessWidget {
  final void Function() onPressed;
  final double? width;
  final double? height;
  final bool? isHaveTitle;
  final double? opacity;
  final double? iconSize;
  final String title;

  const CreateTimelineButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.isHaveTitle,
    this.opacity,
    this.iconSize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderSide:
          BorderSide(color: colorTheme.get2DDA93.withOpacity(opacity ?? 1)),
      width: width ?? context.width * 0.85,
      height: height ?? context.sizeHeight(50),
      onPress: onPressed,
      backgroundColor:
          ThemeManager.backgroundButton().withOpacity(opacity ?? 1),
      borderRadius: context.sizeWidth(5),
      child: isHaveTitle == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTitle(context),
                _buildCameraIcon(context: context),
              ],
            )
          : _buildCameraIcon(
              context: context, iconOpacity: opacity, iconSize: iconSize),
    );
  }

  factory CreateTimelineButton.fullWidth({
    required BuildContext context,
    required void Function() onPressed,
    required String title,
  }) {
    return CreateTimelineButton(
      onPressed: onPressed,
      isHaveTitle: true,
      width: context.width * 0.85,
      height: context.sizeHeight(55),
      title: title,
    );
  }

  factory CreateTimelineButton.customSize({
    required BuildContext context,
    required void Function() onPressed,
    required double? width,
    required double? height,
    double? opacity,
    double? iconSize,
    required String title,
  }) {
    return CreateTimelineButton(
      onPressed: onPressed,
      isHaveTitle: false,
      width: width,
      height: height,
      iconSize: iconSize,
      opacity: opacity,
      title: title,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: theme(context).textTheme.titleMedium!.copyWith(
            color:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.6),
          ),
    );
  }

  Widget _buildCameraIcon({
    required BuildContext context,
    double? iconOpacity,
    double? iconSize,
  }) {
    return CustomSvg(
      path: imageConstant.cameraSVG,
      width: context.sizeWidth(iconSize ?? 25),
      color: theme(context)
          .textTheme
          .titleMedium!
          .color!
          .withOpacity(iconOpacity ?? 0.6),
    );
  }
}