import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class TimeLineItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const TimeLineItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.sizeWidth(12),
                width: context.sizeWidth(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.get2DDA93,
                ),
              ),
              context.sizedBox(height: 5),
              Container(
                width: context.sizeWidth(4),
                height: context.sizeHeight(190),
                color: colorTheme.get2DDA93,
              ),
            ],
          ),
          context.sizedBox(width: 10),
          Expanded(
            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorTheme.get2DDA93.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  context.sizedBox(height: 5),
                  Text(
                    title,
                    maxLines: 2,
                    style: theme(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: context.padding(all: 15),
                    child: CustomCatchedNetWorkImage(
                      width: context.sizeWidth(250),
                      height: context.sizeHeight(150),
                      imageUrl: image,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
