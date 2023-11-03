import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_modal.dart';
import 'package:plant_market/src/features/user/presentation/widgets/leaf_plus_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/plant_name.dart';
import 'package:plant_market/src/features/user/presentation/widgets/zoom_out_button.dart';

class AppBarUserPage extends StatelessWidget {
  final Color? colorLeadingAppBar;
  final double zoomOutCreateTimelineButtonOpacity;
  final bool listTimeLineIsEmpty;
  final void Function(TimeLineModel timeLineModel) updateTimeLine;
  final String backgroundImage;
  final int lengthOfListTimeLine;
  const AppBarUserPage({
    super.key,
    required this.colorLeadingAppBar,
    required this.zoomOutCreateTimelineButtonOpacity,
    required this.updateTimeLine,
    required this.listTimeLineIsEmpty,
    required this.backgroundImage,
    required this.lengthOfListTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        return SliverAppBar(
          pinned: true,
          snap: true,
          leadingWidth: context.sizeWidth(80),
          floating: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          expandedHeight: context.sizeHeight(160),
          leading: LeafPlusButton(color: colorLeadingAppBar),
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(context.sizeWidth(24)),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: listTimeLineIsEmpty
                    ? Image.asset(
                        imageConstant.backGroundPNG,
                        fit: BoxFit.cover,
                      )
                    : CustomCatchedNetWorkImage(
                        imageUrl: backgroundImage,
                        borderRadius: context.sizeWidth(24),
                      ),
              ),
            ),
            title: PlantName(plantName: userInfo!.selectedPlantName),
          ),
          actions: [
            ZoomOutButton(
              borderRadius: context.sizeWidth(10),
              opacity: zoomOutCreateTimelineButtonOpacity,
              onPressed: () => _showCreatePostModal(context),
              iconPath: imageConstant.cameraSVG,
            ),
          ],
        );
      },
    );
  }

  void _showCreatePostModal(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: CreateTimelineModal(
        updateTimeLine: updateTimeLine,
        currentLengthOfListTimeLine: lengthOfListTimeLine,
      ),
    );
  }
}
