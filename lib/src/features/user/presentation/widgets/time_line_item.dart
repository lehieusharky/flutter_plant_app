import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
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
      padding: context.padding(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: theme(context).textTheme.titleLarge,
          ),
          context.sizedBox(height: 5),
          CustomCatchedNetWorkImage(
            width: context.width,
            height: context.sizeHeight(180),
            imageUrl: image,
          ),
        ],
      ),
    );
  }
}
