import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CustomModal {
  static baseModal({
    required BuildContext context,
    required double height,
    required Widget child,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: ThemeManager.backgroundButton(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: child,
        );
      },
    );
  }

  static settingModal({
    required BuildContext context,
    required String title,
    required String field1,
    required String field2,
    required String iconPath1,
    required String iconPath2,
    required void Function() onPressed1,
    required void Function() onPressed2,
    required bool isChoosed1,
    required bool isChoosed2,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: context.sizeHeight(180),
          color: ThemeManager.backgroundButton(),
          child: Padding(
            padding: context.padding(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.sizedBox(height: 5),
                Text(
                  title,
                  style: theme(context).textTheme.titleLarge,
                ),
                context.sizedBox(height: 20),
                buildField(
                    context: context,
                    value: field1,
                    iconPath: iconPath1,
                    onPressed: onPressed1,
                    isChoosed: isChoosed1),
                context.sizedBox(height: 30),
                buildField(
                    context: context,
                    value: field2,
                    iconPath: iconPath2,
                    onPressed: onPressed2,
                    isChoosed: isChoosed2),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget buildField({
    required BuildContext context,
    required String value,
    required String iconPath,
    required void Function() onPressed,
    required bool isChoosed,
  }) {
    return InkWell(
      onTap: () {
        onPressed();
        Navigator.pop(context);
      },
      highlightColor: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSvg(
                path: iconPath,
                width: context.sizeWidth(25),
                height: context.sizeWidth(25),
              ),
              context.sizedBox(width: 10),
              Text(
                value,
                style: theme(context).textTheme.titleMedium,
              ),
            ],
          ),
          isChoosed
              ? Icon(
                  Icons.check_circle,
                  size: context.sizeWidth(25),
                  color: colorTheme.get2DDA93.withOpacity(0.8),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
