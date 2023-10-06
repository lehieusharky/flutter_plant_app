import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/home/data/mock/list_post_mock.dart';
import 'package:plant_market/src/features/home/presentation/widgets/item_post.dart';

class PostsHomePage extends StatefulWidget {
  const PostsHomePage({super.key});

  @override
  State<PostsHomePage> createState() => _PosstHomePageState();
}

class _PosstHomePageState extends State<PostsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: context.padding(horizontal: 12),
      child: SizedBox(
        height: context.sizeHeight(250),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: ListPostMock.posts.length,
          itemBuilder: (context, index) {
            return ItemPost(index: index);
          },
        ),
      ),
    );
  }
}
