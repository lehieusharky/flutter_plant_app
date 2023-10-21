import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

import 'dart:math' as math;

class SettingButton extends StatelessWidget {
  final String title;
  final String field;
  final String iconTitlePath;
  final void Function() onPressed;

  const SettingButton({
    super.key,
    required this.title,
    required this.field,
    required this.onPressed,
    required this.iconTitlePath,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      boxShadowColor: ThemeManager.shadowButton(),
      width: context.width,
      height: context.sizeHeight(55),
      onPress: onPressed,
      backgroundColor: ThemeManager.backgroundButton(),
      borderRadius: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(context),
          _buildField(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(
          path: iconTitlePath,
          color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.8),
          width: context.sizeWidth(20),
        ),
        context.sizedBox(width: 5),
        Text(
          title,
          style: theme(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: context.sizeWidth(14)),
        ),
      ],
    );
  }

  Widget _buildField(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          field,
          style: theme(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        context.sizedBox(width: 7),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: theme(context).textTheme.titleMedium!.color,
            size: context.sizeWidth(20),
          ),
        ),
      ],
    );
  }
}
