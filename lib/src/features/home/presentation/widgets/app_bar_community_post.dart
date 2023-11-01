import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class AppBarCommunityPost extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String id;
  const AppBarCommunityPost({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  State<AppBarCommunityPost> createState() => _AppBarCommunityPostState();
}

class _AppBarCommunityPostState extends State<AppBarCommunityPost> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.sizeHeight(460),
      toolbarHeight: context.sizeHeight(200),
      floating: true,
      leadingWidth: context.width,
      backgroundColor: Colors.transparent,
      leading: const SizedBox(),
      pinned: true,
      elevation: 0,
      snap: true,
      flexibleSpace: Stack(
        children: [
          _buildImage(),
          _buildMark(),
          _buildTitle(context),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => context.pop(true),
          child: CustomSvg(
            path: imageConstant.exitSVG,
            width: context.sizeWidth(35),
          ),
        ),
        CustomHeartButton(
          isLiked: _isLiked(),
          onPressed: (status) async {
            return status;
          },
        ),
      ],
    );
  }

  bool _isLiked() {
    try {
      return userInfo!.listFavoriteCommunityPost.contains(widget.id);
    } catch (e) {
      return false;
    }
  }

  Widget _buildTitle(BuildContext cibtext) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: context.padding(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLeading(context),
              Text(
                widget.title,
                style: theme(context).textTheme.titleLarge!.copyWith(
                    fontSize: context.sizeWidth(30),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMark() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: context.width,
            height: context.sizeHeight(460 / 2),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  colorTheme.getFFFFFF,
                  colorTheme.getFFFFFF.withOpacity(0.7),
                  colorTheme.getFFFFFF.withOpacity(0.1),
                  Colors.transparent,
                ])),
          )),
    );
  }

  Widget _buildImage() {
    return Positioned.fill(
      child: CustomCatchedNetWorkImage(
        imageUrl: widget.imageUrl,
        width: context.width,
        height: context.sizeHeight(460),
        borderRadius: context.sizeWidth(24),
      ),
    );
  }
}
