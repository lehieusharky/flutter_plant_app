import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_post_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/plant_identity_modal.dart';
import 'package:plant_market/src/features/shake_animation/presentation/pages/part_shake_animation_page.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class ZoomOutButtonHomePage extends StatelessWidget {
  final Offset begin;
  final Offset end;
  final int lengthOfCommunityList;
  final void Function(CommunityPostModel communityPostModel)
      updateListCommunityPostModel;

  const ZoomOutButtonHomePage({
    super.key,
    required this.begin,
    required this.end,
    required this.lengthOfCommunityList,
    required this.updateListCommunityPostModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          context: context,
          iconPath: imageConstant.cameraSVG,
          onPressed: () => _showTopicModal(
            context: context,
            child: const PlantIdentifyModal(),
          ),
        ),
        context.sizedBox(width: 20),
        _buildIconButton(
          context: context,
          iconPath: imageConstant.communitySVG,
          onPressed: () => _showTopicModal(
            context: context,
            child: CreateCommunityPostModal(
              lengthOfCommunityList: lengthOfCommunityList,
              updateListCommunityPostModel: updateListCommunityPostModel,
            ),
          ),
        ),
        context.sizedBox(width: 20),
        _buildIconButton(
          context: context,
          iconPath: imageConstant.gallerySVG,
          onPressed: () => _showTopicModal(
            context: context,
            child: const ShakeAnimationPage(),
          ),
        ),
      ],
    );
  }

  factory ZoomOutButtonHomePage.scrollDown(
      int lengthOfCommunityList,
      final void Function(CommunityPostModel communityPostModel)
          updateListCommunityPostModel) {
    return ZoomOutButtonHomePage(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
      lengthOfCommunityList: lengthOfCommunityList,
      updateListCommunityPostModel: updateListCommunityPostModel,
    );
  }

  factory ZoomOutButtonHomePage.scrollUp(
      int lengthOfCommunityList,
      final void Function(CommunityPostModel communityPostModel)
          updateListCommunityPostModel) {
    return ZoomOutButtonHomePage(
      end: const Offset(0, 1),
      begin: Offset.zero,
      lengthOfCommunityList: lengthOfCommunityList,
      updateListCommunityPostModel: updateListCommunityPostModel,
    );
  }

  Widget _buildIconButton({
    required void Function() onPressed,
    required BuildContext context,
    required String iconPath,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: CustomSvg(
        path: iconPath,
        color: colorTheme.get2DDA93,
        width: context.sizeWidth(30),
      ),
    ).animate().slide(
          duration: 300.ms,
          curve: Curves.easeInOut,
          begin: begin,
          end: end,
        );
  }

  void _showTopicModal({required BuildContext context, required Widget child}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: child,
    );
  }
}
