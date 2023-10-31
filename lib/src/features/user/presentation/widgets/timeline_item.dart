import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_milestone.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class TimeLineItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;
  final bool isFirstItem;
  final int lengthOfListTimeLine;
  const TimeLineItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
    required this.isFirstItem,
    required this.lengthOfListTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: colorTheme.get2DDA93,
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: colorTheme.getFF6262,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Delete',
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TimeLineMineStone(
            index: index,
            isFirstItem: isFirstItem,
            lengthOfListTimeLine: lengthOfListTimeLine,
          ),
          context.sizedBox(width: 5),
          Expanded(
            child: Stack(
              children: [
                _buildBackground(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(context),
                    _buildDesciption(context),
                  ],
                ),
              ],
            ),
          ),
        ],
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
        style: theme(context).textTheme.titleLarge!.copyWith(),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 8, top: 8, bottom: 5),
      child: Center(
        child: CustomCatchedNetWorkImage(
          width: context.width * 0.9,
          height: context.sizeHeight(160),
          imageUrl: image,
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return CustomShadow.button(
      boxShadowColor: ThemeManager.shadowButton(),
      child: Container(
        width: context.width,
        height: context.sizeHeight(230),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.sizeWidth(5)),
          color: ThemeManager.backgroundButton(),
        ),
      ),
    );
  }
}
