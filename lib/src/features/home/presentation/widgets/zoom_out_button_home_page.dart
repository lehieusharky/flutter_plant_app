import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_post_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/gallery_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/plant_identity_modal.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class ZoomOutButtonHomePage extends StatelessWidget {
  final Offset begin;
  final Offset end;

  const ZoomOutButtonHomePage({
    super.key,
    required this.begin,
    required this.end,
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

  factory ZoomOutButtonHomePage.scrollDown() {
    return const ZoomOutButtonHomePage(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    );
  }

  factory ZoomOutButtonHomePage.scrollUp() {
    return const ZoomOutButtonHomePage(
      end: Offset(0, 1),
      begin: Offset.zero,
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
