import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CommunityPostDetails extends StatelessWidget {
  final CommunityPostModel communityPostModel;
  final void Function() addFavoriteCommunityPost;

  const CommunityPostDetails({
    super.key,
    required this.communityPostModel,
    required this.addFavoriteCommunityPost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _buildImage(context),
              Column(
                children: [
                  context.sizedBox(height: 400),
                  Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: colorTheme.getFFFFFF.withOpacity(0.9),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: _buildBody(context),
                  ),
                ],
              )
            ],
          ),
          context.sizedBox(height: 10),
          Padding(
            padding: context.padding(horizontal: 12),
            child: CustomButton.send(
              context: context,
              onPressed: addFavoriteCommunityPost,
              title: 'Luu bai viet',
              backgroundColor: colorTheme.get2DDA93,
            ),
          ),
          context.sizedBox(height: 10),
        ],
      ),
    ));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.sizedBox(height: 10),
          _buildTags(context),
          Text(
            communityPostModel.title,
            style: theme(context).textTheme.titleLarge!.copyWith(
                  fontSize: context.sizeWidth(30),
                ),
          ),
          context.sizedBox(height: 5),
          Text(
            communityPostModel.description,
            style: theme(context).textTheme.titleMedium,
          ),
          context.sizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTags(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(20),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: communityPostModel.tags.length,
          separatorBuilder: (context, index) => context.sizedBox(width: 5),
          itemBuilder: (context, index) {
            return Text(
              communityPostModel.tags[index],
              style: theme(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                  ),
            );
          }),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        CustomCatchedNetWorkImage(
          imageUrl: communityPostModel.image,
          width: context.width,
          height: context.sizeHeight(450),
          borderRadius: context.sizeWidth(0),
        ),
        Padding(
          padding: context.padding(horizontal: 5, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(
                color: colorTheme.getFFFFFF,
              ),
              CustomHeartButton(
                isLiked: _isLiked(),
                onPressed: (status) async {
                  return status;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isLiked() {
    return userInfo!.listFavoriteCommunityPost.contains(communityPostModel.id);
  }
}
