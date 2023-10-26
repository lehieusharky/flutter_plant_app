import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_post_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/gallery_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/plant_identity_modal.dart';

class ZoomOutButtonHomePage extends StatelessWidget {
  const ZoomOutButtonHomePage({super.key});

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
            child: const CreateCommunityPostModal(),
          ),
        ),
        context.sizedBox(width: 20),
        _buildIconButton(
          context: context,
          iconPath: imageConstant.gallerySVG,
          onPressed: () => _showTopicModal(
            context: context,
            child: const GalleryModal(),
          ),
        ),
      ],
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
        color: theme(context).textTheme.titleMedium!.color,
        width: context.sizeWidth(28),
      ),
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
