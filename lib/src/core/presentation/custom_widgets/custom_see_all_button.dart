import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CustomSeeAllButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function() onPressed;

  const CustomSeeAllButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 12),
      child: CustomButton(
        width: width,
        height: context.sizeHeight(45),
        onPress: onPressed,
        backgroundColor: ThemeManager.backgroundButton(),
        borderRadius: context.sizeWidth(24),
        borderSide: const BorderSide(
          color: Color(0xffD8D8D8),
          width: 1,
        ),
        child: _buildTitle(context),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate(context).seeAll,
          style: theme(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
