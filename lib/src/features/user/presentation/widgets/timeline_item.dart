import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_milestone.dart';

import 'package:plant_market/src/theme/theme_manager.dart';

class TimeLineItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;
  final bool isFirstItem;
  final int lengthOfListTimeLine;
  final String createAt;
  const TimeLineItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
    required this.isFirstItem,
    required this.lengthOfListTimeLine,
    required this.createAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TimeLineMineStone(
            index: index,
            isFirstItem: isFirstItem,
            lengthOfListTimeLine: lengthOfListTimeLine,
          ),
          context.sizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDataTime(context),
                context.sizedBox(height: 5),
                _buildImage(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTime(BuildContext context) {
    return Text(
      createAt,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: theme(context).textTheme.titleLarge!.copyWith(
            fontSize: context.sizeWidth(15),
            fontWeight: FontWeight.w700,
            color: theme(context).textTheme.titleLarge!.color!.withOpacity(0.5),
          ),
    );
  }

  Widget _buildDesciption(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 20, vertical: 5),
      child: Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: theme(context).textTheme.titleLarge!.copyWith(
              fontSize: context.sizeWidth(22),
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomShadow.button(
          boxShadowColor: ThemeManager.shadowButton(),
          child: CustomCatchedNetWorkImage(
            width: context.width * 0.9,
            height: context.sizeHeight(240),
            borderRadius: context.sizeWidth(24),
            imageUrl: image,
          ),
        ),
        _buildMark(context),
        _buildDesciption(context),
      ],
    );
  }

  Widget _buildMark(BuildContext context) {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: context.width,
            height: context.sizeHeight(120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.sizeWidth(23)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ThemeManager.backgroundButton(),
                  ThemeManager.backgroundButton().withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          )),
    );
  }
}
