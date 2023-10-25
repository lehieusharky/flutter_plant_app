import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';

class LeadingAppBar extends StatelessWidget {
  final Color? color;
  final void Function() onPressed;

  const LeadingAppBar({
    super.key,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        onPress: onPressed,
        backgroundColor: Colors.transparent,
        borderRadius: context.sizeWidth(20),
        child: CustomSvg(
          path: imageConstant.leafPlusSvg,
          color: color ?? theme(context).textTheme.titleMedium!.color!,
          width: context.sizeWidth(25),
          height: context.sizeHeight(25),
        ),
      ),
    );
  }
}
