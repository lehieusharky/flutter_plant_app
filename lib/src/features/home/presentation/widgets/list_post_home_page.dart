import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/community_post_item.dart';

class ListPostHomePage extends StatelessWidget {
  final List<CommunityPostModel> listCommunityPost;
  const ListPostHomePage({super.key, required this.listCommunityPost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 12),
      child: SizedBox(
        height: context.sizeHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: listCommunityPost.length,
          itemBuilder: (context, index) {
            return CommunityPostItem(
              communityPostModel: listCommunityPost[index],
            );
          },
        ),
      ),
    );
  }
}
