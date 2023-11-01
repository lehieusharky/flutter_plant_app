import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/community_post_item.dart';

class ListPostHomePage extends StatefulWidget {
  final List<CommunityPostModel> listCommunityPost;
  const ListPostHomePage({super.key, required this.listCommunityPost});

  @override
  State<ListPostHomePage> createState() => _ListPostHomePageState();
}

class _ListPostHomePageState extends State<ListPostHomePage> {
  final _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(380),
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView.useDelegate(
          itemExtent: context.sizeWidth(270),
          controller: _scrollController,
          scrollBehavior: const ScrollBehavior(),
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 6,
          clipBehavior: Clip.antiAlias,
          onSelectedItemChanged: (index) {},
          childDelegate: ListWheelChildLoopingListDelegate(
              children: widget.listCommunityPost.reversed
                  .toList()
                  .asMap()
                  .entries
                  .map((entry) => RotatedBox(
                        quarterTurns: 1,
                        child:
                            CommunityPostItem(communityPostModel: entry.value),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
