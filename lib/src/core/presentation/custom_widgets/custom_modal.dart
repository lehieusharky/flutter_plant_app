import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
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
      builder: (BuildContext context) {
        return Container(
          height: height,
          color: ThemeManager.backgroundButton(),
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
                    onPressed: onPressed1),
                context.sizedBox(height: 30),
                buildField(
                    context: context,
                    value: field2,
                    iconPath: iconPath2,
                    onPressed: onPressed2),
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
          // * check which is choosed
          // ! TODO : check
          Icon(
            Icons.check_circle,
            size: context.sizeWidth(25),
            color: colorTheme.get2DDA93.withOpacity(0.8),
          )
        ],
      ),
    );
  }
}
