import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/user/data/enums/user_page_section.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class SectionTopicButton extends StatelessWidget {
  final String icon;
  final String title;
  final void Function() onPressed;
  final UserPageSection userPageSection;
  const SectionTopicButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.userPageSection,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: context.padding(horizontal: 12, vertical: 5),
        child: Container(
          width: context.width,
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
                path: icon,
                width: context.sizeWidth(40),
                height: context.sizeWidth(40),
                color: colorTheme.get2DDA93,
              ),
              context.sizedBox(height: 5),
              Text(
                title,
                style: theme(context).textTheme.titleLarge!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
