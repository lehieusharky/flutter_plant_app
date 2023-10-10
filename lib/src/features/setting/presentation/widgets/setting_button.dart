import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class SettingButton extends StatelessWidget {
  final String title;
  final String value;

  const SettingButton({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      boxShadowColor: ThemeManager.shadowButton(),
      width: context.width,
      height: context.sizeHeight(55),
      onPress: () {},
      backgroundColor: ThemeManager.backgroundButton(),
      borderRadius: 3,
      child: Padding(
        padding: context.padding(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme(context).textTheme.titleSmall,
            ),
            Text(
              value,
              style: theme(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
