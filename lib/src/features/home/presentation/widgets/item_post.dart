import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

class ItemPost extends StatelessWidget {
  final CommunityPostModel communityPostModel;
  const ItemPost({super.key, required this.communityPostModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(right: 15),
      child: SizedBox(
        width: context.sizeWidth(280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomCatchedNetWorkImage(
                  width: context.sizeWidth(280),
                  height: context.sizeHeight(150),
                  imageUrl: communityPostModel.image,
                ),
                const CustomHeartButton(),
              ],
            ),
            context.sizedBox(height: 10),
            _buildTitle(context),
            context.sizedBox(height: 5),
            _buildAuthorAndDateTime(context),
            context.sizedBox(height: 5),
            _buildTag(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      communityPostModel.title,
      style: theme(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAuthorAndDateTime(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Le Nguyen Duc Hieu',
          style: theme(context).textTheme.titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
        const Text('__'),
        Text(
          '01/10/2023',
          style: theme(context).textTheme.titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTag() {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding(horizontal: 3),
            child: Text(
              '#hoaHong',
              style: theme(context).textTheme.titleSmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          );
        },
      ),
    );
  }
}
