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
  final void Function() updateLengthOfCommunityPost;

  const ZoomOutButtonHomePage({
    super.key,
    required this.begin,
    required this.end,
    required this.lengthOfCommunityList,
    required this.updateListCommunityPostModel,
    required this.updateLengthOfCommunityPost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 50),
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: context.padding(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIconButton(
                context: context,
                iconPath: imageConstant.cameraSVG,
                onPressed: () => _showTopicModal(
                  context: context,
                  child: const PlantIdentifyModal(),
                ),
              )
                  .animate()
                  .slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: begin,
                    end: end,
                  )
                  .animate()
                  .slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: const Offset(0, 0),
                    end: const Offset(0.5, 0),
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
                    updateLengthOfCommunityPost: updateLengthOfCommunityPost,
                  ),
                ),
              ).animate().slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: begin,
                    end: end,
                  ),
              context.sizedBox(width: 20),
              _buildIconButton(
                context: context,
                iconPath: imageConstant.gallerySVG,
                onPressed: () => _showTopicModal(
                  context: context,
                  child: const ShakeAnimationPage(),
                ),
              )
                  .animate()
                  .slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: begin,
                    end: end,
                  )
                  .animate()
                  .slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: const Offset(0, 0),
                    end: const Offset(-0.5, 0),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  factory ZoomOutButtonHomePage.scrollDown(
      int lengthOfCommunityList,
      final void Function() updateLengthOfCommunityPost,
      final void Function(CommunityPostModel communityPostModel)
          updateListCommunityPostModel) {
    return ZoomOutButtonHomePage(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
      lengthOfCommunityList: lengthOfCommunityList,
      updateListCommunityPostModel: updateListCommunityPostModel,
      updateLengthOfCommunityPost: updateLengthOfCommunityPost,
    );
  }

  factory ZoomOutButtonHomePage.scrollUp(
      int lengthOfCommunityList,
      final void Function() updateLengthOfCommunityPost,
      final void Function(CommunityPostModel communityPostModel)
          updateListCommunityPostModel) {
    return ZoomOutButtonHomePage(
      end: const Offset(0, 1),
      begin: Offset.zero,
      lengthOfCommunityList: lengthOfCommunityList,
      updateListCommunityPostModel: updateListCommunityPostModel,
      updateLengthOfCommunityPost: updateLengthOfCommunityPost,
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
    );
  }

  void _showTopicModal({required BuildContext context, required Widget child}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.85,
      child: child,
    );
  }
}
