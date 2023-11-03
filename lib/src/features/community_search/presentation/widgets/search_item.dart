import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/community_post_details.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class SearchItem extends StatelessWidget {
  final CommunityPostModel communityPostModel;
  const SearchItem({super.key, required this.communityPostModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showCommunityPostDetailModel(context),
      child: Padding(
        padding: context.padding(vertical: 10),
        child: Container(
          width: context.width,
          height: context.sizeHeight(110),
          decoration: BoxDecoration(
            color: ThemeManager.backgroundButton(),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: ThemeManager.shadowButton(),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buldImage(context),
                context.sizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTitle(context),
                      context.sizedBox(height: 5),
                      _buildSpectificName(context),
                      // context.sizedBox(height: 5),
                      // _buildTag(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildTag(BuildContext context) {
  //   return SizedBox(
  //     height: context.sizeHeight(30),
  //     child: ListView.separated(
  //         scrollDirection: Axis.horizontal,
  //         shrinkWrap: true,
  //         itemCount: communityPostModel.tags.length,
  //         separatorBuilder: (context, index) => context.sizedBox(width: 5),
  //         itemBuilder: (context, index) {
  //           return Text(
  //             communityPostModel.tags[index],
  //             style: theme(context).textTheme.titleSmall,
  //           );
  //         }),
  //   );
  // }

  Widget _buildTitle(BuildContext context) {
    return Text(
      communityPostModel.title,
      maxLines: 2,
      style: theme(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSpectificName(BuildContext context) {
    return Text(
      communityPostModel.description,
      maxLines: 1,
      style: theme(context).textTheme.titleSmall!.copyWith(),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buldImage(BuildContext context) {
    return CustomCatchedNetWorkImage(
      imageUrl: communityPostModel.image,
      width: context.sizeWidth(95),
      height: context.sizeHeight(95),
    );
  }

  void _showCommunityPostDetailModel(BuildContext context) {
    CustomModal.baseModal(
        context: context,
        height: context.height * 0.9,
        child: CommunityPostDetails(
            communityPostModel: communityPostModel,
            addFavoriteCommunityPost: () => {}));
  }
}
