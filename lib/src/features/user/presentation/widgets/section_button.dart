import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class SectionTopicButton extends StatefulWidget {
  final String icon;
  final String title;
  const SectionTopicButton(
      {super.key, required this.icon, required this.title});

  @override
  State<SectionTopicButton> createState() => _SectionTopicButtonState();
}

class _SectionTopicButtonState extends State<SectionTopicButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 70),
      child: Container(
        width: context.sizeWidth(240),
        height: context.sizeHeight(115),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(context.sizeWidth(24)),
          border: Border.all(width: 1, color: colorTheme.get2DDA93),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvg(
              path: widget.icon,
              width: context.sizeWidth(40),
              height: context.sizeWidth(40),
              color: colorTheme.get2DDA93,
            ),
            context.sizedBox(height: 5),
            Text(
              widget.title,
              style: theme(context).textTheme.titleLarge!,
            ),
          ],
        ),
      ),
    );
  }
}
