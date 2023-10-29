import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/community_post_details.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class ItemPost extends StatelessWidget {
  final CommunityPostModel communityPostModel;
  const ItemPost({
    super.key,
    required this.communityPostModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showTopicModal(context: context),
      child: Padding(
        padding: context.padding(right: 15),
        child: SizedBox(
          width: context.sizeWidth(230),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CustomCatchedNetWorkImage(
                    width: context.sizeWidth(250),
                    height: context.sizeHeight(320),
                    opacity: 0.7,
                    imageUrl: communityPostModel.image,
                  ),
                  Padding(
                    padding: context.padding(horizontal: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(context),
                        context.sizedBox(height: 3),
                        _buildAuthor(context),
                        context.sizedBox(height: 3),
                        _buildDateTime(context),
                        context.sizedBox(height: 3),
                        _buildTag(context),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      communityPostModel.title,
      maxLines: 2,
      style: AppTextTheme.darkTheme(context)
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return Text(
      communityPostModel.authorName,
      style: AppTextTheme.darkTheme(context).titleSmall!.copyWith(),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDateTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.watch_later_outlined,
          size: context.sizeWidth(15),
          color: AppTextTheme.darkTheme(context).titleSmall!.color,
        ),
        context.sizedBox(width: 3),
        Text(
          '01/10/2023',
          style: AppTextTheme.darkTheme(context).titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(30),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: communityPostModel.tags.length,
          separatorBuilder: (context, index) => context.sizedBox(width: 5),
          itemBuilder: (context, index) {
            return Text(
              communityPostModel.tags[index],
              style: AppTextTheme.darkTheme(context).titleSmall,
            );
          }),
    );
  }

  void _showTopicModal({required BuildContext context}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: CommunityPostDetails(
        communityPostModel: communityPostModel,
      ),
    );
  }
}
